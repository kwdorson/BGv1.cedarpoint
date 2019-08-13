/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

#define MAVFNC MAV_guiWeaponShopSimple
#define MAVCFG missionConfigFile >> "maverick_weaponshop_cfg"
#include "gui_includes.h"

#define CASH (missionNamespace getVariable getText (MAVCFG >> "cashVar"))
#define SYMBOL getText (MAVCFG >> "cashSymbol")

disableSerialization;

params [
	["_mode", "", [""]],
	["_params", [], [[]]]
];

switch _mode do {
    case "onLoad": {
        _params params [
			["_display", displayNull, [displayNull]]
		];

		showChat false;
		MAVV(Cart) = [];
		MAVV(Total) = 0;
		MAVV(Spam) = diag_tickTime;

		private _ctrlTitle = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TITLE;
		_ctrlTitle ctrlSetText (getText (MAVV(Cfg) >> "title"));

		private _ctrlCashOnHand = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_ONHAND;
		_ctrlCashOnHand ctrlSetText format [getText (MAVCFG >> "localization" >> "msgCashOnHand"), SYMBOL, [CASH] call BIS_fnc_numberText];

        private _ctrlCloseButton = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_CLOSE;
		_ctrlCloseButton ctrlAddEventHandler ["ButtonClick", {ctrlParent (_this select 0) closeDisplay 0;}];

		private _ctrlTV = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE;
		_ctrlTV ctrlAddEventhandler ["TreeSelChanged", {["onTreeChanged", _this] call MAVFNC}];

		private _ctrlCart = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_LIST;
		_ctrlCart ctrlAddEventHandler ["LBDblClick", {["remove", _this] call MAVFNC}];

		private _cartTitle = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TOTAL;
		_cartTitle ctrlSetText format [getText (MAVCFG >> "localization" >> "msgCartTotal"), SYMBOL, [MAVV(Total)] call BIS_fnc_numberText];

		private _infoBtn = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_INFOBTN;
		_infoBtn ctrlSetTooltip getText (MAVCFG >> "localization" >> "msgInfoTooltip2");

		private _ctrlTabs = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TABS;
		_ctrlTabs ctrlAddEventHandler ["ToolBoxSelChanged", {["onTabChanged", _this] call MAVFNC}];

		private _ctrlSearch = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCH;
		_ctrlSearch ctrlAddEventHandler ["KeyUp", {["onKeyUp", _this] call MAVFNC}];

		private _ctrlButtonSearch = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCHBTN;
		_ctrlButtonSearch ctrlAddEventHandler ["ButtonClick", {["onSearch", _this] call MAVFNC}];

		private _ctrlButtonCollapse = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_COLLAPSE;
		_ctrlButtonCollapse ctrlAddEventHandler ["ButtonClick", {["onCollapse", _this] call MAVFNC}];

    	private _ctrlButtonExpand = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_EXPAND;
    	_ctrlButtonExpand ctrlAddEventHandler ["ButtonClick", {["onExpand", _this] call MAVFNC}];

		["onTabChanged", [_ctrlTabs, 0]] call MAVFNC;
    };

	case "onTabChanged": {
		_params params [
			["_ctrlTabs", controlNull, [controlNull]],
			["_ctrlSelIndex", -1, [0]]
		];

		private _display = ctrlParent _ctrlTabs;
		private _cat = ["weapons", "magazines", "attachments", "items"] select _ctrlSelIndex;

		private _ctrlTV = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE;
		tvClear _ctrlTV;

		switch _cat do {
			case "weapons": {
				{
					_x params ["_class", "_price", "_condition", "_display"];

					if (call compile _condition) then {
						(_class call MAV_shop_fnc_itemInfo) params ["_itemName", "_itemPicture"];
						private _aComp = [_class, true] call MAV_shop_fnc_weaponCompatibleItems;
						private _weaponName = [_display, _itemName] select (_display isEqualTo "");
						private _weaponIndex = _ctrlTV tvAdd [[], _weaponName];
						_ctrlTV tvSetPicture [[_weaponIndex], _itemPicture];
						_ctrlTV tvSetData [[_weaponIndex], str ([_class, _price, _display])];

						{
							_x params ["_comp", "_compT"];
							private _array = getArray (MAVV(Cfg) >> _comp);
							private _arrayComp = (_array apply {private _lower = toLower (_x select 0); _lower}) arrayIntersect _aComp;
							if !(_arrayComp isEqualTo []) then {
								private _compIndex = _ctrlTV tvAdd [[_weaponIndex], _compT];
								{
									private _compItem = _x;
									private _index = [_compItem, _array apply {[toLower (_x select 0), _x select 1, _x select 2, _x select 3]}] call MAV_shop_fnc_index;
									(_array select _index) params ["_subClass", "_subPrice", "_subCondition", "_subDisplay"];
									if (call compile _subCondition) then {
										(_compItem call MAV_shop_fnc_itemInfo) params ["_itemName", "_itemPicture"];
										private _compName = [_subDisplay, _itemName] select (_subDisplay isEqualTo "");
										private _compWeaponIndex = _ctrlTV tvAdd [[_weaponIndex, _compIndex], _compName];
										_ctrlTV tvSetPicture [[_weaponIndex, _compIndex, _compWeaponIndex], _itemPicture];
										_ctrlTV tvSetData [[_weaponIndex, _compIndex, _compWeaponIndex], str ([_subClass, _subPrice, _subDisplay])];
									};
								} forEach _arrayComp;
							};
						} forEach [["magazines", "Magazines"], ["attachments", "Attachments"]];
					};
				} forEach (getArray (MAVV(Cfg) >> _cat));
			};
			default {
				{
					_x params ["_class", "_price", "_condition", "_display"];

					if (call compile _condition) then {
						(_class call MAV_shop_fnc_itemInfo) params ["_itemName", "_itemPicture"];
						private _weaponName = [_display, _itemName] select (_display isEqualTo "");
						private _weaponIndex = _ctrlTV tvAdd [[], _weaponName];
						_ctrlTV tvSetPicture [[_weaponIndex], _itemPicture];
						_ctrlTV tvSetData [[_weaponIndex], str ([_class, _price, _display])];
						_ctrlTV tvSetValue [[_weaponIndex], _price];
					};
				} forEach (getArray (MAVV(Cfg) >> _cat));
			};
		};

		if (_ctrlTV tvCount [] isEqualTo 0) then {
			_ctrlTV tvAdd [[], getText (MAVCFG >> "localization" >> "msgEmptyShop")];
		};

		_ctrlTV tvSetCurSel [0];

		private _enable = _ctrlSelIndex isEqualTo 0;

		private _ctrlButtonCollapse = _display displayCtrl MAV_IDC_GUIWEAPONSHOP_COLLAPSE;
		_ctrlButtonCollapse ctrlEnable _enable;

    	private _ctrlButtonExpand = _display displayCtrl MAV_IDC_GUIWEAPONSHOP_EXPAND;
		_ctrlButtonExpand ctrlEnable _enable;
	};

    case "onTreeChanged": {
		_params params [
			["_ctrlFactoryTreeView", controlNull, [controlNull]],
			["_path", [], [[]]]
		];

		private _display = ctrlParent _ctrlFactoryTreeView;
		private _btnAddAction = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_ADD;
		private _info = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_INFO;

		if (ctrlShown _btnAddAction) then {
			_btnAddAction ctrlRemoveAllEventHandlers "ButtonClick";
			_btnAddAction ctrlShow false;
		};

		private _data = _ctrlFactoryTreeView tvData _path;

		if (_data isEqualTo "") exitWith {
			_info ctrlSetStructuredText parseText "";
		};

		(parseSimpleArray _data) params ["_className", "_price"];

		private _afford = (MAVV(Total) + _price) > CASH;

		_info ctrlSetStructuredText parseText format [getText (MAVCFG >> "localization" >> "msgInfoText"), (["#1CFF0B", "#D01700"] select _afford), [_price] call BIS_fnc_numberText, SYMBOL];

		if !(_afford) then {
			_btnAddAction ctrlAddEventHandler ["ButtonClick", {["add", _this] call MAVFNC}];
			_btnAddAction ctrlShow true;
		};
    };
    case "add": {
		if (MAVV(Spam) > diag_tickTime) exitWith {};
		MAVV(Spam) = diag_tickTime + 0.3;

		_params params [
			["_ctrlAddBtn", controlNull, [controlNull]]
		];

		if (count MAVV(Cart) isEqualTo getNumber (MAVV(Cfg) >> "maxCart")) exitWith {
			hint getText (MAVCFG >> "localization" >> "msgCartFull");
		};

		private _display = ctrlParent _ctrlAddBtn;
		private _tvList = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE;
		private _cartList = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_LIST;
		private _cartTitle = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TOTAL;
		private _completeBtn = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_COMPLETE;

		private _tvIndex = tvCurSel _tvList;
		private _tvData = _tvList tvData _tvIndex;

		if (_tvData isEqualTo "") exitWith {};

		(parseSimpleArray _tvData) params ["_className", "_price", "_itemDisplay"];

		(_className call MAV_shop_fnc_itemInfo) params ["_itemName", "_itemPicture"];
		private _header = [_itemDisplay, _itemName] select (_itemDisplay isEqualTo "");

		private _index = _cartList lbAdd _header;
		_cartList lbSetData [_index, _className];
		_cartList lbSetValue [_index, _price];
		_cartList lbSetPicture [_index, _itemPicture];

		MAVV(Cart) pushBack [toLower _className, _price];
		MAVV(Total) = MAVV(Total) + _price;

		_cartTitle ctrlSetText format [getText (MAVCFG >> "localization" >> "msgCartTotal"), SYMBOL, [MAVV(Total)] call BIS_fnc_numberText];

		if (!(lbSize _cartList isEqualTo 0) && {!(ctrlShown _completeBtn)}) then {
			_completeBtn ctrlAddEventHandler ["ButtonClick", {["complete", _this] call MAVFNC}];
			_completeBtn ctrlShow true;
		};

		_tvList tvSetCurSel _tvIndex;
    };

	case "remove": {
		if (MAVV(Spam) > diag_tickTime) exitWith {};
		MAVV(Spam) = diag_tickTime + 0.3;

		_params params [
			["_cartList", controlNull, [controlNull]],
			["_index", -1, [0]]
		];

		if (_index isEqualTo -1) exitWith {};

		private _display = ctrlParent _cartList;
		private _value = _cartList lbValue _index;

		MAVV(Cart) deleteAt _index;
		_cartList lbDelete _index;

		MAVV(Total) = MAVV(Total) - _value;

		private _cartTitle = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TOTAL;
		_cartTitle ctrlSetText format [getText (MAVCFG >> "localization" >> "msgCartTotal"), SYMBOL, [MAVV(Total)] call BIS_fnc_numberText];

		if (lbSize _cartList isEqualTo 0) then {
			private _completeBtn = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_COMPLETE;
			_completeBtn ctrlRemoveAllEventHandlers "ButtonClick";
			_completeBtn ctrlShow false;
		};

		private _tvList = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE;
		_tvList tvSetCurSel (tvCurSel _tvList);
	};

	case "complete": {
		if (MAVV(Spam) > diag_tickTime) exitWith {};
		MAVV(Spam) = diag_tickTime + 1;

		_params params [
			["_completeBtn", controlNull, [controlNull]]
		];

		private _display = ctrlParent _completeBtn;

		if (isNull _display) exitWith {};

        if (MAVV(Cart) isEqualTo []) exitWith {
			hint getText (MAVCFG >> "localization" >> "msgCartEmpty");
        };

        if (MAVV(Total) > CASH) exitWith {
			hint getText (MAVCFG >> "localization" >> "msgNotEnoughCash");
        };

		private _override = cbChecked (_display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_CHECK);

        private _cash = 0;
        private _global = false;
		private _added = false;

		{
            _x params ["_item", "_price"];
			if ([_item, _override] call MAV_shop_fnc_handleGear) then {
				_cash = _cash + _price;
				_added = true;
			} else {
				_global = true;
			};
        } count (MAVV(Cart) select {_x param [0] isEqualType "" && {!(_x param [0] isEqualTo "")}});

        _display closeDisplay 1;

		if (_cash isEqualTo 0 && {!_added}) exitWith {
			hint getText (MAVCFG >> "localization" >> "msgOverrideAlert");
		};

		missionNamespace setVariable [getText (MAVCFG >> "cashVar"), (CASH - _cash)];
		hint format [getText (MAVCFG >> "localization" >> "msgTransactionComplete"), SYMBOL, [_cash] call BIS_fnc_numberText];

        if (_global) then {
			hint getText (MAVCFG >> "localization" >> "msgNotEnoughSpace");
        };

		call compile getText (MAVCFG >> "saveFunction");
	};

	case "onKeyUp": {
		_params params ["_ctrl"];
		private _display = ctrlParent _ctrl;
		private _searchBtn = _display displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCHBTN;
		private _ctrlText = ctrlText _ctrl isEqualTo "";
		_searchBtn ctrlSetText (["\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa", "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa"] select _ctrlText);
		_searchBtn ctrlSetTooltip ([getText (MAVCFG >> "localization" >> "msgClear"), getText (MAVCFG >> "localization" >> "msgSearch")] select _ctrlText);
	};

	case "onSearch": {
		private _ctrl = ctrlParent (_params param [0]) displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCH;
		_ctrl ctrlSetText "";
		["onKeyUp", [_ctrl]] call MAVFNC;
	};

	case "onCollapse": {
		tvCollapseAll (ctrlParent (_params param [0]) displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE);
	};

	case "onExpand": {
		tvExpandAll (ctrlParent (_params param [0]) displayCtrl MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE);
	};

    case "onUnload": {
		MAVV(Cart) = nil;
		MAVV(Total) = nil;
		MAVV(Cfg) = nil;
		MAVV(Type) = nil;
		MAVV(Spam) = nil;
		showChat true;
	};
};

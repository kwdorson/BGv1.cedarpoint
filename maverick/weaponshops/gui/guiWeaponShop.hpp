/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

class MAV_guiWeaponShop {
	idd = MAV_IDD_GUIWEAPONSHOP;
	onLoad = "['weaponshops\gui', 'MAV_guiWeaponShop', _this, true] call MAV_gui_fnc_openGUI";
	class Controls {
		#define WEAPONSHOP_W 110
		#define WEAPONSHOP_H 70
		#define WEAPONSHOP_BORDER 1.5
		#define WEAPONSHOPCART_W 70
		class WeaponListGroup: MAV_ctrlControlsGroupNoScrollbars {
			idc = MAV_IDC_GUIWEAPONSHOP_LISTGRP;
			x = CENTER_X - (41 + (WEAPONSHOP_W / 2)) * GRID_W;
			y = (safeZoneY + safeZoneH) - (SIZE_S + WEAPONSHOP_H + 15) * GRID_H;
			w = WEAPONSHOP_W * GRID_W;
			h = WEAPONSHOP_H * GRID_H;
			class Controls {
				class Background: MAV_ctrlStaticBackground {
					x = 0;
					y = 0;
					w = WEAPONSHOP_W * GRID_W;
					h = WEAPONSHOP_H * GRID_H;
				};
				class Header: MAV_ctrlStaticTitle {
					idc = MAV_IDC_GUIWEAPONSHOP_TITLE;
					x = 0;
					y = 0;
					w = WEAPONSHOP_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "STORE TITLE";
				};
				class Tabs: MAV_ctrlToolbox {
					idc = MAV_IDC_GUIWEAPONSHOP_TABS;
					x = 0;
					y = (0.1 + SIZE_M) * GRID_H;
					w = WEAPONSHOP_W * GRID_W;
					h = SIZE_M * GRID_H;
					columns = 4;
					strings[] = {dialogTabWeapon, dialogTabMagazines, dialogTabAttachments, dialogTabOther};
			    };
				class SearchShop: MAV_ctrlEdit {
					idc = MAV_IDC_GUIWEAPONSHOP_SEARCH;
					x = WEAPONSHOP_BORDER * GRID_W;
					y = (WEAPONSHOP_BORDER + SIZE_M + 5) * GRID_H;
					w = (WEAPONSHOP_W - (WEAPONSHOP_BORDER * 2 + (3 * SIZE_M))) * GRID_W;
					h = SIZE_M * GRID_H;
					sizeEx = SIZEEX_PURISTA(SIZEEX_S);
				};
				class ButtonSearch: MAV_ctrlButtonSearch {
					idc = MAV_IDC_GUIWEAPONSHOP_SEARCHBTN;
					x = (WEAPONSHOP_W - (WEAPONSHOP_BORDER + 3 * SIZE_M)) * GRID_W;
					y = (WEAPONSHOP_BORDER + SIZE_M + 5) * GRID_H;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					colorBackground[] = {0,0,0,0};
				};
				class ButtonCollapseAll: MAV_ctrlButtonCollapseAll {
					idc = MAV_IDC_GUIWEAPONSHOP_COLLAPSE;
					x = (WEAPONSHOP_W - (WEAPONSHOP_BORDER + 2 * SIZE_M)) * GRID_W;
					y = (WEAPONSHOP_BORDER + SIZE_M + 5) * GRID_H;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
				};
				class ButtonExpandAll: MAV_ctrlButtonExpandAll {
					idc = MAV_IDC_GUIWEAPONSHOP_EXPAND;
					x = (WEAPONSHOP_W - (WEAPONSHOP_BORDER + SIZE_M)) * GRID_W;
					y = (WEAPONSHOP_BORDER + SIZE_M + 5) * GRID_H;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
				};
				class StoreTree: MAV_ctrlTree {
					idc = MAV_IDC_GUIWEAPONSHOP_TREE;
					x = WEAPONSHOP_BORDER * GRID_W;
					y = (WEAPONSHOP_BORDER + (2 * SIZE_M) + 5) * GRID_H;
					w = (WEAPONSHOP_W - (WEAPONSHOP_BORDER * 2)) * GRID_W;
					h = (WEAPONSHOP_H - ((SIZE_M * 2) + 12 + (WEAPONSHOP_BORDER * 2))) * GRID_H;
					sizeEx = SIZEEX_PURISTA(SIZEEX_S);
					idcSearch = MAV_IDC_GUIWEAPONSHOP_SEARCH;
				};
				class ItemInformation: MAV_ctrlStructuredText {
					idc = MAV_IDC_GUIWEAPONSHOP_INFO;
					x = WEAPONSHOP_BORDER * GRID_W;
					y = (WEAPONSHOP_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOP_W * 1.8/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = "";
				};
				class Footer: MAV_ctrlStaticFooter {
					x = 0;
					y = (WEAPONSHOP_H - (SIZE_M + 2)) * GRID_H;
					w = WEAPONSHOP_W * GRID_W;
					h = (SIZE_M + 2) * GRID_H;
				};
				class AddButton: MAV_ctrlButton {
					idc = MAV_IDC_GUIWEAPONSHOP_ADD;
					x = (WEAPONSHOP_W - (WEAPONSHOP_W * 1/3 + WEAPONSHOP_BORDER)) * GRID_W;
					y = (WEAPONSHOP_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOP_W * 1/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = dialogAddBtn;
					colorBackground[] = {0.1,0.1,0.1,1};
					show = 0;
				};
				class ButtonInfo: MAV_ctrlButtonPicture {
					idc = MAV_IDC_GUIWEAPONSHOP_INFOBTN;
					x = (WEAPONSHOP_W - SIZE_M) * GRID_W;
					y = 0;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					colorBackground[] = {1, 1, 1, 0};
					text = "\a3\ui_f\data\GUI\RscCommon\RscDebugConsole\biki_ca.paa";
					offsetPressedX = 0;
					offsetPressedY = 0;
				};
			};
		};
		class CartGroup: MAV_ctrlControlsGroupNoScrollbars {
			idc = MAV_IDC_GUIWEAPONSHOP_CARTGRP;
			x = CENTER_X - ((WEAPONSHOPCART_W / 2) - 51) * GRID_W;
			y = (safeZoneY + safeZoneH) - (SIZE_S + WEAPONSHOP_H + 15) * GRID_H;
			w = WEAPONSHOPCART_W * GRID_W;
			h = WEAPONSHOP_H * GRID_H;
			class Controls {
				class StoreCartBackground: MAV_ctrlStaticBackground {
					x = 0;
					y = 0;
					w = WEAPONSHOPCART_W * GRID_W;
					h = WEAPONSHOP_H * GRID_H;
				};
				class CartHeader: MAV_ctrlStaticTitle {
					idc = MAV_IDC_GUIWEAPONSHOP_TOTAL;
					x = 0;
					y = 0;
					w = WEAPONSHOPCART_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "Cart Total";
				};
				class CashAvail: MAV_ctrlStaticTitle {
					idc = MAV_IDC_GUIWEAPONSHOP_ONHAND;
					x = 0;
					y = (0.1 + SIZE_M) * GRID_H;
					w = WEAPONSHOP_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "Cash on Hand: AMOUNT HERE";
					colorBackground[] = {1,1,1,0.07};
				};
				class CartList: MAV_ctrlListbox {
					idc = MAV_IDC_GUIWEAPONSHOP_LIST;
					x = WEAPONSHOP_BORDER * GRID_W;
					y = (WEAPONSHOP_BORDER + SIZE_M + 5) * GRID_H;
					w = (WEAPONSHOPCART_W - (WEAPONSHOP_BORDER * 2)) * GRID_W;
					h = (WEAPONSHOP_H - ((SIZE_M * 2) + 7 + (WEAPONSHOP_BORDER * 2))) * GRID_H;
					rowHeight = "1.4 * (((( safezoneW / safezoneH ) min 1.2) / 1.2) / 25)";
					sizeEx = SIZEEX_PURISTA(SIZEEX_M);
				};
				class CartFooter: MAV_ctrlStaticFooter {
					x = 0;
					y = (WEAPONSHOP_H - (SIZE_M + 2)) * GRID_H;
					w = WEAPONSHOPCART_W * GRID_W;
					h = (SIZE_M + 2) * GRID_H;
				};
				class Override: MAV_ctrlCheckbox {
					idc = MAV_IDC_GUIWEAPONSHOP_CHECK;
					x = (WEAPONSHOPCART_W - SIZE_M) * GRID_W;
					y = 0;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					tooltip = dialogOverrideTooltip;
				};
				class CompleteButton: MAV_ctrlButton {
					idc = MAV_IDC_GUIWEAPONSHOP_COMPLETE;
					x = (WEAPONSHOPCART_W - (WEAPONSHOPCART_W * 1/3 + WEAPONSHOP_BORDER)) * GRID_W;
					y = (WEAPONSHOP_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOPCART_W * 1/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = dialogCompleteBtn;
					show = 0;
				};
				class CloseButton: MAV_ctrlButton {
					idc = MAV_IDC_GUIWEAPONSHOP_CLOSE;
					x = WEAPONSHOP_BORDER * GRID_W;
					y = (WEAPONSHOP_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOPCART_W * 1/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = dialogCloseBtn;
				};
			};
		};
	};
};

class MAV_guiWeaponShopSimple {
	idd = MAV_IDD_GUIWEAPONSHOPSIMPLE;
	onLoad = "['weaponshops\gui', 'MAV_guiWeaponShopSimple', _this, true] call MAV_gui_fnc_openGUI";
	class Controls {
		#define WEAPONSHOPSIMPLE_W 110
		#define WEAPONSHOPSIMPLE_H 70
		#define WEAPONSHOPSIMPLE_BORDER 1.5
		#define WEAPONSHOPSIMPLECART_W 70
		class WeaponListGroup: MAV_ctrlControlsGroupNoScrollbars {
			idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_LISTGRP;
			x = CENTER_X - (41 + (WEAPONSHOPSIMPLE_W / 2)) * GRID_W;
			y = CENTER_Y - (WEAPONSHOPSIMPLE_H / 2) * GRID_H;
			w = WEAPONSHOPSIMPLE_W * GRID_W;
			h = WEAPONSHOPSIMPLE_H * GRID_H;
			class Controls {
				class Background: MAV_ctrlStaticBackground {
					x = 0;
					y = 0;
					w = WEAPONSHOPSIMPLE_W * GRID_W;
					h = WEAPONSHOPSIMPLE_H * GRID_H;
				};
				class Header: MAV_ctrlStaticTitle {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_TITLE;
					x = 0;
					y = 0;
					w = WEAPONSHOPSIMPLE_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "STORE TITLE";
				};
				class Tabs: MAV_ctrlToolbox {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_TABS;
					x = 0;
					y = (0.1 + SIZE_M) * GRID_H;
					w = WEAPONSHOPSIMPLE_W * GRID_W;
					h = SIZE_M * GRID_H;
					columns = 4;
					strings[] = {dialogTabWeapon, dialogTabMagazines, dialogTabAttachments, dialogTabOther};
			    };
				class SearchShop: MAV_ctrlEdit {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCH;
					x = WEAPONSHOPSIMPLE_BORDER * GRID_W;
					y = (WEAPONSHOPSIMPLE_BORDER + SIZE_M + 5) * GRID_H;
					w = (WEAPONSHOPSIMPLE_W - (WEAPONSHOPSIMPLE_BORDER * 2 + (3 * SIZE_M))) * GRID_W;
					h = SIZE_M * GRID_H;
					sizeEx = SIZEEX_PURISTA(SIZEEX_S);
				};
				class ButtonSearch: MAV_ctrlButtonSearch {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCHBTN;
					x = (WEAPONSHOPSIMPLE_W - (WEAPONSHOPSIMPLE_BORDER + 3 * SIZE_M)) * GRID_W;
					y = (WEAPONSHOPSIMPLE_BORDER + SIZE_M + 5) * GRID_H;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					colorBackground[] = {0,0,0,0};
				};
				class ButtonCollapseAll: MAV_ctrlButtonCollapseAll {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_COLLAPSE;
					x = (WEAPONSHOPSIMPLE_W - (WEAPONSHOPSIMPLE_BORDER + 2 * SIZE_M)) * GRID_W;
					y = (WEAPONSHOPSIMPLE_BORDER + SIZE_M + 5) * GRID_H;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
				};
				class ButtonExpandAll: MAV_ctrlButtonExpandAll {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_EXPAND;
					x = (WEAPONSHOPSIMPLE_W - (WEAPONSHOPSIMPLE_BORDER + SIZE_M)) * GRID_W;
					y = (WEAPONSHOPSIMPLE_BORDER + SIZE_M + 5) * GRID_H;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
				};
				class StoreTree: MAV_ctrlTree {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_TREE;
					x = WEAPONSHOPSIMPLE_BORDER * GRID_W;
					y = (WEAPONSHOPSIMPLE_BORDER + (2 * SIZE_M) + 5) * GRID_H;
					w = (WEAPONSHOPSIMPLE_W - (WEAPONSHOPSIMPLE_BORDER * 2)) * GRID_W;
					h = (WEAPONSHOPSIMPLE_H - ((SIZE_M * 2) + 12 + (WEAPONSHOPSIMPLE_BORDER * 2))) * GRID_H;
					sizeEx = SIZEEX_PURISTA(SIZEEX_S);
					idcSearch = MAV_IDC_GUIWEAPONSHOPSIMPLE_SEARCH;
				};
				class ItemInformation: MAV_ctrlStructuredText {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_INFO;
					x = WEAPONSHOPSIMPLE_BORDER * GRID_W;
					y = (WEAPONSHOPSIMPLE_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOPSIMPLE_W * 1.8/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = "";
				};
				class Footer: MAV_ctrlStaticFooter {
					x = 0;
					y = (WEAPONSHOPSIMPLE_H - (SIZE_M + 2)) * GRID_H;
					w = WEAPONSHOPSIMPLE_W * GRID_W;
					h = (SIZE_M + 2) * GRID_H;
				};
				class AddButton: MAV_ctrlButton {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_ADD;
					x = (WEAPONSHOPSIMPLE_W - (WEAPONSHOPSIMPLE_W * 1/3 + WEAPONSHOPSIMPLE_BORDER)) * GRID_W;
					y = (WEAPONSHOPSIMPLE_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOPSIMPLE_W * 1/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = dialogAddBtn;
					colorBackground[] = {0.1,0.1,0.1,1};
					show = 0;
				};
				class ButtonInfo: MAV_ctrlButtonPicture {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_INFOBTN;
					x = (WEAPONSHOPSIMPLE_W - SIZE_M) * GRID_W;
					y = 0;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					colorBackground[] = {1, 1, 1, 0};
					text = "\a3\ui_f\data\GUI\RscCommon\RscDebugConsole\biki_ca.paa";
					offsetPressedX = 0;
					offsetPressedY = 0;
				};
			};
		};
		class CartGroup: MAV_ctrlControlsGroupNoScrollbars {
			idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_CARTGRP;
			x = CENTER_X - ((WEAPONSHOPSIMPLECART_W / 2) - 51) * GRID_W;
			y = CENTER_Y - (WEAPONSHOPSIMPLE_H / 2) * GRID_H;
			w = WEAPONSHOPSIMPLECART_W * GRID_W;
			h = WEAPONSHOPSIMPLE_H * GRID_H;
			class Controls {
				class StoreCartBackground: MAV_ctrlStaticBackground {
					x = 0;
					y = 0;
					w = WEAPONSHOPSIMPLECART_W * GRID_W;
					h = WEAPONSHOPSIMPLE_H * GRID_H;
				};
				class CartHeader: MAV_ctrlStaticTitle {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_TOTAL;
					x = 0;
					y = 0;
					w = WEAPONSHOPSIMPLECART_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "Cart Total";
				};
				class CashAvail: MAV_ctrlStaticTitle {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_ONHAND;
					x = 0;
					y = (0.1 + SIZE_M) * GRID_H;
					w = WEAPONSHOPSIMPLECART_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "Cash on Hand: AMOUNT HERE";
					colorBackground[] = {1,1,1,0.07};
				};
				class CartList: MAV_ctrlListbox {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_LIST;
					x = WEAPONSHOPSIMPLE_BORDER * GRID_W;
					y = (WEAPONSHOPSIMPLE_BORDER + SIZE_M + 5) * GRID_H;
					w = (WEAPONSHOPSIMPLECART_W - (WEAPONSHOPSIMPLE_BORDER * 2)) * GRID_W;
					h = (WEAPONSHOPSIMPLE_H - ((SIZE_M * 2) + 7 + (WEAPONSHOPSIMPLE_BORDER * 2))) * GRID_H;
					rowHeight = "1.4 * (((( safezoneW / safezoneH ) min 1.2) / 1.2) / 25)";
					sizeEx = SIZEEX_PURISTA(SIZEEX_M);
				};
				class CartFooter: MAV_ctrlStaticFooter {
					x = 0;
					y = (WEAPONSHOPSIMPLE_H - (SIZE_M + 2)) * GRID_H;
					w = WEAPONSHOPSIMPLECART_W * GRID_W;
					h = (SIZE_M + 2) * GRID_H;
				};
				class Override: MAV_ctrlCheckbox {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_CHECK;
					x = (WEAPONSHOPCART_W - SIZE_M) * GRID_W;
					y = 0;
					w = SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					tooltip = dialogOverrideTooltip;
				};
				class CompleteButton: MAV_ctrlButton {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_COMPLETE;
					x = (WEAPONSHOPSIMPLECART_W - (WEAPONSHOPSIMPLECART_W * 1/3 + WEAPONSHOPSIMPLE_BORDER)) * GRID_W;
					y = (WEAPONSHOPSIMPLE_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOPSIMPLECART_W * 1/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = dialogCompleteBtn;
					show = 0;
				};
				class CloseButton: MAV_ctrlButton {
					idc = MAV_IDC_GUIWEAPONSHOPSIMPLE_CLOSE;
					x = WEAPONSHOPSIMPLE_BORDER * GRID_W;
					y = (WEAPONSHOPSIMPLE_H - ((SIZE_M + 2) / 2 + SIZE_M / 2)) * GRID_H;
					w = (WEAPONSHOPSIMPLECART_W * 1/3) * GRID_W;
					h = SIZE_M * GRID_H;
					text = dialogCloseBtn;
				};
			};
		};
	};
};
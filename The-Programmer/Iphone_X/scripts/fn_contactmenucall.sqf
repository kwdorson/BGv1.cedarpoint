/*
    Author: Jean_Park
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Discord : https://discord.gg/DhFUFsq

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
_type = param [0,0,[0]];
if (_type isEqualTo 1) then {createDialog "The_Programmer_Iphone_Contact_Menu";};

disableSerialization;
_display = findDisplay 3115;
_contactList = _display displayCtrl 3005;
lbClear _contactList;
_contactList lbSetCurSel -1;

{
  _pseudo = _x select 0;
  _numero = _x select 1;
  _contactList lbAdd format["- %1 (%2)",_pseudo,_numero];
  _contactList lbSetData [(lbSize _contactList)-1,format["%1",_numero]];
} forEach maxence_contact;

_contactList ctrlAddEventHandler ["LBDblClick",{
    _numStr = (_this select 0) lbData (_this select 1);
    closeDialog 0;
    _display2 = findDisplay 21000;
    _numeroTextCtrl = _display2 displayCtrl 21001;
    _numeroTextCtrl ctrlSetText _numStr;
    uiNamespace setVariable ["compose_number",_numStr];
}];

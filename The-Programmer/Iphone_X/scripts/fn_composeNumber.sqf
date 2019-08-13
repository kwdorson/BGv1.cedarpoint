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
_newValue = param [0,"",[""]];

_oldValues = uiNamespace getVariable ["compose_number",""];
_newValues = _oldValues;

if (_newValue isEqualTo "") then {
    _newValues = _oldValues select [0,(count _oldValues)-1];
    uiNamespace setVariable ["compose_number",_newValues];
} else {
    _newValues = _oldValues + _newValue;
};

uiNamespace setVariable ["compose_number",_newValues];
ctrlSetText [21001,_newValues];

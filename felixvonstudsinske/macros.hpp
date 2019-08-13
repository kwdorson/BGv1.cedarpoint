#include "Makro_Einstellungen.hpp"
/* Farbcodes */
#define WEST_BLAU_STR "#(rgb,8,8,3)color(0,0,1,1)"
#define WEST_BLAU_ARR [0,0,1,1]
#define EAST_ROT_STR "#(rgb,8,8,3)color(0.42,0,0,1)"
#define EAST_ROT_ARR [0.42,0,0,1]
#define GUER_GRUEN_STR "#(rgb,8,8,3)color(0,0.65,0,1)"
#define GUER_GRUEN_ARR [0,0.65,0,1]
#define CIV_LILA_STR "#(rgb,8,8,3)color(0.38,0.06,0.52,1)"
#define CIV_LILA_ARR [0.38,0.06,0.52,1]
#define DEFAULT_ARR [0,0,0,1]
#define DEFAULT_STR "#(rgb,8,8,3)color(0,0,0,1)"
#define FRAKTIONSFARBE_ARR(pl) switch (side pl) do {\
case civilian: {CIV_LILA_ARR}; case east: {EAST_ROT_ARR};\
case west: {WEST_BLAU_ARR}; case independent: {GUER_GRUEN_ARR};\
case civilian: {CIV_LILA_ARR}; case east: {EAST_ROT_ARR};\
default {DEFAULT_ARR};\
}
#define FRAKTIONSFARBE_STR(pl) switch (side pl) do {\
case west: {WEST_BLAU_STR}; case independent: {GUER_GRUEN_STR};\
case civilian: {CIV_LILA_STR}; case east: {EAST_ROT_STR};\
default {DEFAULT_STR};\
}
#define MARKER_FRAKTIONSFARBE_STR(pl) switch (side pl) do {\
case west: {"ColorWEST"}; case independent: {"ColorGUER"};\
case civilian: {"ColorCIV"}; case east: {"ColorEAST"};\
default {"ColorUNKNOWN"};\
}
//Namespace Macros
#define MSV missionNamespace setVariable 
#define UNSV uiNamespace setVariable 
#define MGV missionNamespace getVariable 
#define UNGV uiNamespace getVariable
#define PROFSV profileNameSpace setVariable
#define PROFGV profileNameSpace getVariable
#define PARSSV parsingNamespace setVariable
#define PARSGV parsingNamespace getVariable
/* Systemsachen */
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define SEL2(ARRAY,INDEX1,INDEX2) SEL(SEL(ARRAY,INDEX1),INDEX2)
#define SEL3(ARRAY,INDEX1,INDEX2,INDEX3) SEL(SEL(SEL(ARRAY,INDEX1),INDEX2),INDEX3)
#define BARESVAR "life_cash"
#define KONTOVAR "life_atmbank"
#define BARES life_cash
#define SBARES(var) BARES = var
#define KONTO life_atmbank
#define SKONTO(var) KONTO = var
//System Macros
#define grpP (group player)
#define grX(obj) (group obj)
#define PUID (getPlayerUID player)
#define PUIDX(obj) (getPlayerUID obj)
//Scripting Macros
#define BEN_SUSPEND if !canSuspend exitWith {private _t = format["unscheduled environment gefunden: %1 (kommend von %3); Zeile: %2",if (isNil {_fnc_scriptName}) then {"undefiniert"} else {_fnc_scriptName},__LINE__,if (isNil {_fnc_scriptNameParent}) then {"undefiniert"} else {_fnc_scriptNameParent}]; [_t] spawn life_fnc_TuningMenuMsg;}
#define KONSTANT(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) // Eine Variable mit einer anderenen konstant machen {CODE}
#define CALLKONST(var) (call var)
#define CC(string) (call compile format["%1",string])
#define VP (vehicle player)
#define GV getVariable
#define PGV player GV
#define GGV grpP GV
#define GXGV(obj) grX(obj) GV
#define SV setVariable
#define PSV player SV
#define GSV grpP SV
#define GXSV(obj) grX(obj) SV
#define VEHSV VP SV
#define U_GP (units grpP)
#define UNIF_P (uniform player)
#define BACKPACK_P (backpack player)
#define VEST_P (vest player)
#define BRILLE_P (goggles player)
#define PWEAP (primaryWeapon player)
#define PWEAP_I (primaryWeaponItems player)
#define HGUN (handgunWeapon player)
#define HGUN_I (handgunItems player)
#define LAUNCHER (secondaryWeapon player)
#define RRAND(var1) round(random(var1))
#define SUL(target,arr) target setUnitLoadout arr 
#define GUL(target) getUnitLoadout target 
#define ASSIGNPL_IT (assignedItems player)
#define ANIMSTATE(obj) (animationState obj)
#define PSIDE(pl) switch (side pl) do {	case west: {"WEST"}; case independent: {"GUER"}; case civilian: {"CIV"}; case east: {"EAST"}; default {"unknown"}; }
#define KINDOF(fahr) if((fahr isKindOf "Air") || (fahr isKindOf "Helicopter")) then {"Luftfahrzeug";} else {if((fahr isKindOf "Car_F")) then {"Auto";} else {if(fahr isKindOf "Ship") then {"Boot";} else {if(fahr isKindOf "Tank") then {"Tank";} else {"Error";};};};}
#define KINDOF1(fahr) if((fahr isKindOf "Air") || (fahr isKindOf "Helicopter")) then {"Air";} else {if((fahr isKindOf "Car")) then {"Car";} else {if(fahr isKindOf "Ship") then {"Boat";} else {if(fahr isKindOf "Tank") then {"Tank";} else {"Error";};};};}
#define ZAHLENKONVERTER(number) number call life_fnc_numberText
#define FIXNUMBER(number) (number toFixed 2)
#define CONTROLAUSWAHL params [\
	["_ControlListbox",controlNull,[controlNull]],\
	["_Auswahl",-1,[0]]\
]
#define ERROR(errortext) ["Hinweis",errortext,true] call life_fnc_ENS_Hint
#define ERROR2(errortext) ["Hinweis",errortext,true] call life_fnc_ENS_Hint
//Display Macros
#define CTRL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define DISPCTRL(disp,ctrl) (##disp displayCtrl ##ctrl)
#define STRUCT ctrlSetStructuredText parseText
#define STEXT ctrlSetText
#define STEXTC ctrlSetTextColor
#define CEN ctrlEnable
#define CENT ctrlEnable true
#define CENF ctrlEnable false
#define CSHOW ctrlShow
#define CSBC ctrlSetBackgroundColor
#define CSTTP ctrlSetTooltip 
#define CSTTPCOL ctrlSetTooltipColorText 
#define DISP(displ) (findDisplay displ)
#define WAIT_NOTNULL_DISP(idd) waitUntil {!(isNull (findDisplay idd))}
//Config Macros
#define FETCH_CFG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CFG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CFG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define MC(TYPE,ENTRY) TYPE(missionConfigFile >> ENTRY)
#define MCFG(CFG,CLASS) missionConfigFile >> CFG >> CLASS
#define MCFG_1(TYPE,CFG,CLASS) TYPE(missionConfigFile >> CFG >> CLASS)
#define M_CFG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define M_CFG2(TYPE,CFG,CLASS,ENTRY,SUB,SUB2) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY >> SUB >> SUB2)
#define CFG_TEXT_CFGVEHICLES_DISP(class) getText(configFile >> "CfgVehicles" >> class >> "displayName")
#define EXIT_Aufgabe_Wip_MSG if (MGV ["FWFVS_AufgabeWIP",false]) exitWith {ERROR2("Es ist aktuell eine Aufgabe in Abeit");}
// Tasten
#define ESC 1
#define FEINS 59
#define FZWEI 60
#define FDREI 61
#define FVIER 62
#define FFUENF 63
#define FSECHS 64
#define FSIEBEN 65
#define FACHT 66
#define FNEUN 67
#define FZEHN 68
#define FELF 87
#define FZWOELF 88
#define DRUCK 183
#define ROLLEN 70
#define PAUSE 197
#define ZIRKUMFLEX 41
#define EINS 2
#define ZWEI 3
#define DREI 4
#define VIER 5
#define FUENF 6
#define SECHS 7
#define SIEBEN 8
#define ACHT 9
#define NEUN 10
#define NUL 11 // 0 Null
#define SZ 12 // ß ? 
#define APO1 13 // ` ´
#define ZURUECK 14 
#define TAB 15
#define QU 16 // QU
#define WE 17 // W
#define EE 18 // E
#define ER 19 // R
#define TE 20 // T
#define ZET 21 // Z
#define UH 22 // U
#define II 23 // I
#define OH 24 // O
#define PE 25 // P
#define UE 26 // Ü
#define PL 27 // + * ~
#define ENTER 28
#define CAPS 58
#define AA 30 // A
#define ES 31 // S
#define DE 32 // D
#define EF 33 // F
#define GE 34 // G
#define HA 35 // H
#define JO 36 // J
#define KA 37 // K
#define EL 38 // L
#define OE 39 // Ö
#define AE 40 // Ä
#define HASH 43 // # '
#define LSHIFT 42
#define KROK 86 // < > |
#define YPS 44 // Y
#define IX 45 // X
#define CE 46 // C
#define VAU 47 // V
#define BE 48 // B
#define EN 49 // N
#define EM 50 // M
#define KOMMA 51 // , ;
#define PUNKT 52 // . :
#define STRICH 53 // - _
#define RSHIFT 54
#define STRG 29
#define LWIN 219
#define LALT 56 // ALT
#define LEER 57
#define ALTGR 184
#define RWIN 220
#define FENSTER 221 // zwischen RWIN und RSTRG
#define PFEILL 203 // <-
#define PFEILR 205 // ->
#define PFEILO 200 // /
#define PFEILU 208 // \/
#define PASTE 210 // Einfügen
#define POS1 199
#define BILDH 201
#define BILDU 209
#define ENTF 211 // Entfernen
#define ENDE 207
#define NUMPAD 69 // An / Aus
#define NGET 181 // NUMPAD /
#define NMAL 55 // NUMPAD *
#define NMIN 74 // NUMPAD -
#define NUM7 71 // NUMPAD 7
#define NUM8 72 // NUMPAD 8
#define NUM9 73 // NUMPAD 9
#define NUM4 75 // NUMPAD 4
#define NUM5 76 // NUMPAD 5
#define NUM6 77 // NUMPAD 6
#define NUM1 79 // NUMPAD 1
#define NUM2 80 // NUMPAD 2
#define NUM3 81 // NUMPAD 3
#define NUM0 82 // NUMPAD 0
#define NUMK 83 // NUMPAD , ENTF
#define NUMENT 156 // NUMPAD Enter
#define NUMPLUS 78 // NUMPAD +
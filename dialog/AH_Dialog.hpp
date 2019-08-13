#define GUI_GRID_X  (0)
#define GUI_GRID_Y  (0)
#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)
#define GUI_GRID_WAbs   (1)
#define GUI_GRID_HAbs   (1)


class RscEdit_AH: RscEdit {
    style=16;
    autocomplete="scripting";
    text="";
};

class AH_ExecMenu
{
    idd=6969;
    movingEnable = false;
    controls[] = {
        Background,
        ScriptEdit,
        PlayerList,
        ExecPlayer,
        ExecLocal,
        ExecGloal,
        ExecServer,
        ScriptNext,
        ScriptPrevious,
        PlayerSearch
    };

    class Background: RscText
    {
        idc = 1000;
        x = -10.5 * GUI_GRID_W + GUI_GRID_X;
        y = 0 * GUI_GRID_H + GUI_GRID_Y;
        w = 58 * GUI_GRID_W;
        h = 25 * GUI_GRID_H;
        colorBackground[] = {-1,-1,-1,0.7};
    };
    class ScriptEdit: RscEdit_AH
    {
        idc = 1400;
        x = 1.5 * GUI_GRID_W + GUI_GRID_X;
        y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 29.5 * GUI_GRID_W;
        h = 24 * GUI_GRID_H;
    };
    class PlayerList: RscListbox
    {
        idc = 1500;
        x = 31.5 * GUI_GRID_W + GUI_GRID_X;
        y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 15.5 * GUI_GRID_W;
        h = 20 * GUI_GRID_H;
    };
    class ExecPlayer: RscButton
    {
        idc = 1600;
        text = "Execute on Player"; //--- ToDo: Localize;
        type = 1;
        x = 31.5 * GUI_GRID_W + GUI_GRID_X;
        y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 15.5 * GUI_GRID_W;
        h = 2 * GUI_GRID_H;
    };
    class ExecLocal: RscButton
    {
        idc = 1601;
        type = 1;
        text = "Execute (Local)"; //--- ToDo: Localize;
        x = -10 * GUI_GRID_W + GUI_GRID_X;
        y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 11 * GUI_GRID_W;
        h = 4.5 * GUI_GRID_H;
    };
    class ExecGloal: RscButton
    {
        idc = 1602;
        type = 1;
        text = "Execute (Global)"; //--- ToDo: Localize;
        x = -10 * GUI_GRID_W + GUI_GRID_X;
        y = 6 * GUI_GRID_H + GUI_GRID_Y;
        w = 11 * GUI_GRID_W;
        h = 4.5 * GUI_GRID_H;
    };
    class ExecServer: RscButton
    {
        idc = 1603;
        type = 1;
        text = "Execute (Server)"; //--- ToDo: Localize;
        x = -10 * GUI_GRID_W + GUI_GRID_X;
        y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 11 * GUI_GRID_W;
        h = 4.5 * GUI_GRID_H;
    };
    class ScriptNext: RscButton
    {
        idc = 1604;
        type = 1;
        text = "Next Statement"; //--- ToDo: Localize;
        x = -10 * GUI_GRID_W + GUI_GRID_X;
        y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
        w = 11 * GUI_GRID_W;
        h = 3 * GUI_GRID_H;
    };
    class ScriptPrevious: RscButton
    {
        idc = 1605;
        type = 1;
        text = "Previous Statement"; //--- ToDo: Localize;
        x = -10 * GUI_GRID_W + GUI_GRID_X;
        y = 18 * GUI_GRID_H + GUI_GRID_Y;
        w = 11 * GUI_GRID_W;
        h = 3 * GUI_GRID_H;
    };
    class PlayerSearch: RscEdit
    {
        idc = 1401;
        x = 31.5 * GUI_GRID_W + GUI_GRID_X;
        y = 21 * GUI_GRID_H + GUI_GRID_Y;
        w = 15.5 * GUI_GRID_W;
        h = 1 * GUI_GRID_H;
        text="";
    };
};
#include <macro.h>
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(R6cuXKTCWDZFxfbfdATm > (call life_revive_fee)) then {
	R6cuXKTCWDZFxfbfdATm = R6cuXKTCWDZFxfbfdATm - (call life_revive_fee);
} else {
	R6cuXKTCWDZFxfbfdATm = 0;
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate; //Request update of hud.

[] call life_fnc_updateClothing;

if (__GETC__(life_donator) > 2) then {
	[] execVM "addons\chien.sqf";
};

if ((getPlayerUID player) in ["76561198032371812", "76561198093139365"]) then {
	player addaction [("<t color=""#0074E8"">" + ("Menu d'Administration") +"</t>"),"addons\admintools\AdminToolsMain.sqf","",5,false,true,"",""];
};
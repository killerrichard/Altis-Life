/*
	File: fn_updateClothing.sqf
	Author: Cry
	
	Description:
	Met � jour les skins custom
*/

if (uniform player == "U_C_Scientist") then {
	player setObjectTextureGlobal [0,"textures\skins\civil\U_C_Scientist Medecin.jpg"];
};

if (uniform player == "U_Rangemaster") then {
	player setObjectTextureGlobal [0,"textures\skins\police\U_Rangemaster Police.jpg"];
};

if (uniform player == "U_B_CombatUniform_mcam") then {
	player setObjectTextureGlobal [0,"textures\skins\police\U_B_CombatUniform_mcam RAID.jpg"];
};
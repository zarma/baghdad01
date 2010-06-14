//NewUnit===>_unit0
_code_unit0 = {
_g_unit0 = createGroup centerE;
_unit0 = _g_unit0 createUnit ["RUS_Soldier_Marksman", [1,1,0.2], [], 0, 'CAN_COLLIDE'];
_unit0 setPosASL [3426.83,6856.22,4.54545];
_g_unit0 setFormDir 298.965;
removeAllWeapons _unit0;
{_unit0 addWeapon _x;} foreach ["VSS_vintorez","NVGoggles","Binocular","ItemGPS","ItemMap","ItemCompass","ItemWatch","ItemRadio"];
{_unit0 addMagazine _x;} foreach ["20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","HandGrenade_East","HandGrenade_East","SmokeShell","SmokeShellOrange"];
};
//NewUnit===>_unit1
_code_unit1 = {
_g_unit1 = createGroup centerE;
_unit1 = _g_unit1 createUnit ["RUS_Soldier_Marksman", [1,1,0.2], [], 0, 'CAN_COLLIDE'];
_unit1 setPosASL [3414.2,6857.3,4.54545];
_g_unit1 setFormDir 109.665;
removeAllWeapons _unit1;
{_unit1 addWeapon _x;} foreach ["VSS_vintorez","NVGoggles","Binocular","ItemGPS","ItemMap","ItemCompass","ItemWatch","ItemRadio"];
{_unit1 addMagazine _x;} foreach ["20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","HandGrenade_East","HandGrenade_East","SmokeShell","SmokeShellOrange"];
};



_codes = [_code_unit0,_code_unit1];
{
     _nil = call _x
} foreach _codes;


format["_codes %1 ", _codes] call z_smsg;

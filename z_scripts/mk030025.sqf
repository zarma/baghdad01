//[(side player),"HQ"] sidechat format["mk030025"
//NewUnit===>_unit0
_g_unit0 = createGroup centerE;
_unit0 = _g_unit0 createUnit ["RU_Soldier_SL", [1,1,0.2], [], 0, 'CAN_COLLIDE'];
_unit0 setPosASL [3058.64,7709.08,7.34535];
_g_unit0 setFormDir 97.8444;
removeAllWeapons _unit0;
{_unit0 addWeapon _x;} foreach ["ACE_AK74M_PSO","Binocular","NVGoggles","Makarov","ItemGPS","ItemMap","ItemCompass","ItemWatch","ItemRadio"];
{_unit0 addMagazine _x;} foreach ["30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","HandGrenade_East","HandGrenade_East","SmokeShell","SmokeShell","SmokeShellOrange","SmokeShellBlue","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"];
//NewUnit===>_unit1
_g_unit1 = createGroup centerE;
_unit1 = _g_unit1 createUnit ["RU_Soldier_SL", [1,1,0.2], [], 0, 'CAN_COLLIDE'];
_unit1 setPosASL [3136.33,7774.45,11.8014];
_g_unit1 setFormDir 148.305;
removeAllWeapons _unit1;
{_unit1 addWeapon _x;} foreach ["ACE_AK74M_PSO","Binocular","NVGoggles","Makarov","ItemGPS","ItemMap","ItemCompass","ItemWatch","ItemRadio"];
{_unit1 addMagazine _x;} foreach ["30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","HandGrenade_East","HandGrenade_East","SmokeShell","SmokeShell","SmokeShellOrange","SmokeShellBlue","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"];
//NewUnit===>_unit2
_g_unit2 = createGroup centerE;
_unit2 = _g_unit2 createUnit ["RU_Soldier_SL", [1,1,0.2], [], 0, 'CAN_COLLIDE'];
_unit2 setPosASL [3132.63,7777.78,12.1954];
_g_unit2 setFormDir 319.965;
removeAllWeapons _unit2;
{_unit2 addWeapon _x;} foreach ["SVD"];
{_unit2 addMagazine _x;} foreach ["10Rnd_762x54_SVD","ACE_10Rnd_762x54_T_SVD"];

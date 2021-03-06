	// by Xeno
	private ["_vehicle", "_delay", "_marker", "_startpos", "_startdir", "_type", "_disabled", "_name"];
	if (!isServer) exitWith{};
	
	_vehicle = _this select 0;
	_delay = _this select 1;
	_marker = _this select 2;
	_startpos = getposasl _vehicle;
	_startdir = getdir _vehicle;
	_type = typeof _vehicle;
	_name = vehicleVarName _vehicle;

	processInitCommands;
	
	while {true} do {
		sleep (_delay + random 15);
		if (({alive _x} count (crew _vehicle)) == 0) then {
			_disabled = (if (damage _vehicle > 0.9) then {true} else {false});
			if (_disabled || !(alive _vehicle)) then {
				clearVehicleInit _vehicle;
				deletevehicle _vehicle;
				sleep 0.5;
				_vehicle = _type createvehicle _startpos;
				_vehicle setPosASL [_startpos select 0, _startpos select 1, _startpos select 2];
				_vehicle setdir _startdir;
				_vehicle setVehicleVarName _name;
				processInitCommands;
			};
		};
	};

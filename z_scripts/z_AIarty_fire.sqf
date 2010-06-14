//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
//  called by 
// nil=["_battery","_targetpos","_ordnancetype","_rateoffire","_nbrounds"] execVM "z_scripts\z_AIarty_fire.sqf";
// TODO :
//  Testing
//  add dispersion
//
//
//
//
//
//
//////////////////////////////////////////////////////////////////

if (!isServer) exitWith {};

private ["_battery","_targetpos","_ordnancetype","_rateoffire","_nbrounds","_dispersion"];

_battery 		= _this select 0;
_targetpos			= _this select 1;
_ordnancetype = _this select 2;
_rateoffire = _this select 3;
_nbrounds = _this select 4;
_dispersion = _this select 4;
 
//format["_this %1 ", _this] call z_smsg;

_mission 		= ["IMMEDIATE", _ordnancetype, _rateoffire, _nbrounds];
//format["_mission %1 _battery %2 _targetpos %3", _mission,_battery,_targetpos] call z_smsg;

[_battery, _dispersion] call BIS_ARTY_F_SetDispersion;
[_battery, _targetpos, _mission] call BIS_ARTY_F_ExecuteTemplateMission;


format["Fin z_AIarty_Fire", _this] call z_smsg;

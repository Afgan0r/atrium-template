private ["_pos", "_dir", "_vectorUp"];
if (!isNull a3ru_var_dragObject) then {
	_pos = getPosATL a3ru_var_dragObject;
	if ((_pos select 3) < 0) then { _pos SET [3, 0] };
	_dir = getDir a3ru_var_static_helper;
};
detach a3ru_var_dragObject;
deleteVehicle a3ru_var_static_helper;
//if (a3a_var_started) then { _CT lock 0 };
if (!isNull a3ru_var_dragObject) then {
	a3ru_var_dragObject setPos _pos;
	[[a3ru_var_dragObject, _dir], "(_this select 0) setDir (_this select 1)"] call BIS_fnc_MP;
};
player removeAction a3ru_KeyEH_releaseStatic;
player playMove "amovpknlmstpsraswrfldnon";
a3ru_var_static_dragging = false;
a3ru_var_dragObject setVariable ["a3ru_canDrag", objNull, true];
a3ru_var_dragObject = objNull
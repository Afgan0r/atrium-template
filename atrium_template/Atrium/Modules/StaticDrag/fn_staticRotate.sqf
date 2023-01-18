private ["_angle", "_dir"];
if (_this > 0) then {
	_angle = 5;
} else {
	_angle = -5;
};
if !(isNull a3ru_var_static_helper) then {
	if (player distance a3ru_var_dragObject < 6 && alive player) then {
		if (a3ru_var_static_rotate) exitWith {
			_dir = (getDir a3ru_var_static_helper) + _angle;
			_dir = _dir - getDir player;
			a3ru_var_static_helper setDir _dir;
		};
	} else {
		a3ru_var_static_release = true
	};
};
/*
 * Author: Ezhuk, WOG
 * Adapted, refactored and improved: Afgan0r
 * Used to get units count by side in trigger.
 *
 * Arguments:
 * 0: Trigger <OBJECT>
 * 1: Minimum unit height for counting <SCALAR>
 * 2: Maximum unit height for counting <SCALAR>
 *
 * Return Value:
 * Units list. Key: side name <STRING>. Value: units count <SCALAR>
 *
 * Example:
 * [triggerName, -5, 30] call AFG_fnc_getUnitsCountBySide
 *
 * Only server: No
*/

params ["_trigger", "_minZ", "_maxZ"];

_sides = [west, east, resistance];
_units = list _trigger;
_unitsList = createHashMapFromArray [
	["WEST", 0],
	["EAST", 0],
	["GUER", 0]
];

{
	_side = side _x;
	_sideStr = str _side;
	_sideId = _sides find _side;
  _pos = if (surfaceIsWater getPos _x) then { getPosASL _x } else { getPosATL _x };
	_height = _pos # 2;

	if (_sideId != -1 && _height >= _minZ && _height <= _maxZ) then {
		_countOfUnitsOfThisSide = _unitsList get _sideStr;
		_unitsList set [_sideStr, _countOfUnitsOfThisSide + 1];
	}
} forEach _units;

_unitsList

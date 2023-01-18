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

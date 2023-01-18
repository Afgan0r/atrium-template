private ["_CT", "_return"];
_CT = _this;
_return = false;
if !(isNull _CT) then {
	if (
		(_CT isKindOf "StaticWeapon") &&
		(player distance _CT <= 3) &&
		isNull (_CT getVariable ["a3ru_canDrag", objNull]) &&
		((count (crew _CT)) == 0)
	) then { _return = true };
};
_return
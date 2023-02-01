/*
 * Author: Afgan0r
 * Used to complete the mission after capturing all required zones.
 *
 * Arguments:
 * 0: Required zone to capture. Key: marker name, value: which side should capture the zone <HASHMAP>
 * 1: Minimum zones captured count <SCALAR>
 * 2: Side which will win after after capturing all required zones <SIDE>
 * 3: Message whick will show after after capturing all required zones <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_zones, 2, east, "Some message"] spawn AFG_fnc_endMission;
 *
 * Only server: Yes
*/

params ["_markersHashMap", "_minZonesCaptured", "_winningSide", "_winningMessage"];

_isCompleted = false;

while { !_isCompleted } do {
	_capturedZones = [];

	{
		_markerName = _x;
		_requiredOwnerSide = str _y;

		_zoneOwner = missionNamespace getVariable [_markerName + "_pointOwner", ""];
		_isCapturing = missionNamespace getVariable [_markerName + "_capturingInProgress", false];
		_isCapturedSuccesfully = missionNamespace getVariable [_markerName + "_zoneCapturedSuccesfully", false];

		if (_zoneOwner == _requiredOwnerSide && _isCapturing == false && _isCapturedSuccesfully == true) then {
			_capturedZones pushBack _markerName;
		}
	} forEach _markersHashMap;

	if (count _capturedZones >= _minZonesCaptured) then { _isCompleted = true; };

	sleep 5;
};

sleep 2;

[_winningMessage, _winningSide] call a3a_fnc_endMission;

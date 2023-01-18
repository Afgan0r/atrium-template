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

		diag_log [_markerName, _requiredOwnerSide, _zoneOwner, _isCapturing, _isCapturedSuccesfully];

		if (_zoneOwner == _requiredOwnerSide && _isCapturing == false && _isCapturedSuccesfully == true) then {
			_capturedZones pushBack _markerName;
		}
	} forEach _markersHashMap;

	diag_log [_capturedZones, _minZonesCaptured];

	if (count _capturedZones >= _minZonesCaptured) then { _isCompleted = true; };

	sleep 5;
};

sleep 2;

diag_log "all triggers captured";

[_winningMessage, _winningSide] call a3a_fnc_endMission;

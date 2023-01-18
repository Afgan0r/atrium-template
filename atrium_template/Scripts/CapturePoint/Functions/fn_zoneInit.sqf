/*
 * Author: Ezhuk, WOG
 * Adapted, refactored and improved: Afgan0r
 * Used to control zone state.
 *
 * Arguments:
 * See "atrium_template\Scripts\CapturePoint\readme.md"
 *
 * Return Value:
 * None
 *
 * Example:
 * See "atrium_template\Scripts\CapturePoint\readme.md"
 *
 * Only server: Yes
*/

params [
	"_marker",
	"_ownerSide",
	"_captureTime",
	"_zoneName",
	"_capturedMessage",
	"_isCanBeRecaptured",
	"_isEasyCapture",
	"_minZ",
	"_maxZ",
	"_captureAdvantage",
	"_captureCount",
	"_defenceCount",
	"_enableBlinking",
	"_enableNotifications",
	"_debug"
];

_sides = [west, east, resistance];
_markerOwnerColor = (str _ownerSide) call AFG_fnc_getColorBySide;
_marker setMarkerColor _markerOwnerColor;
_marker setMarkerBrush "SolidBorder";

waitUntil { sleep 10; a3a_var_started };

_trigger = _marker call AFG_fnc_createTrigger;
missionNamespace setVariable [_marker + "_pointOwner", str _ownerSide];

_isFinished = false;
_captureStartTime = -1;
_isCapturing = false;

while { !_isFinished } do {
	_unitsCount = [_trigger, _minZ, _maxZ] call AFG_fnc_getUnitsCountBySide;
	_currentOwner = missionNamespace getVariable [_marker + "_pointOwner", ""];

	_ownerUnitsCount = _unitsCount get _currentOwner;
	_prevailingSide = sideLogic;
	_prevailingSideUnitsCount = 0;

	// Calculate units count and detect side that have more units in the zone
	{
		if (_ownerSide != _x) then {
			_count = _unitsCount get (str _x);

			if (_count > _prevailingSideUnitsCount) then {
				_prevailingSide = _x;
				_prevailingSideUnitsCount = _count;
			}
		}
	} forEach _sides;

	_capturingState = false;
	_prevailingSideColor = (str _prevailingSide) call AFG_fnc_getColorBySide;

	//Checking conditions
	switch (true) do {
    // Standart
    case (_ownerUnitsCount < _defenceCount && _prevailingSideUnitsCount >= _captureCount): { _capturingState = true; };
    // Easy capture
    case (_ownerUnitsCount == 0 && _isEasyCapture == true && _prevailingSideUnitsCount > 0): { _capturingState = true; };
    // Advantage
    case (
			_prevailingSideUnitsCount > 0
			&& _captureAdvantage > 0
			&& _ownerUnitsCount * _captureAdvantage <= _prevailingSideUnitsCount
		): { _capturingState = true; };
	};

	if (_debug == true) then {
		diag_log [text "marker name", _marker];
		diag_log [text "units", _unitsCount];
		diag_log [text "curr owner", _currentOwner];
		diag_log [text "owner units count", _ownerUnitsCount];
		diag_log [text "prevailing side", _prevailingSide];
		diag_log [text "prevailing side units", _prevailingSideUnitsCount];
		diag_log [text "standart condition", _ownerUnitsCount < _defenceCount && _prevailingSideUnitsCount >= _captureCount];
		diag_log [text "easy capture condition", _ownerUnitsCount == 0 && _isEasyCapture == true && _prevailingSideUnitsCount > 0];
		diag_log [text "advantage condition", _prevailingSideUnitsCount > 0
			&& _captureAdvantage > 0
			&& _ownerUnitsCount * _captureAdvantage <= _prevailingSideUnitsCount
		];
		diag_log [text "capturing state", _capturingState];
		diag_log [text "is capturing", _isCapturing];
		diag_log [text "capture time", _captureTime];
		diag_log [text "capture start time", _captureStartTime];
		diag_log [text "capturing time", diag_tickTime - _captureStartTime];
	};

	if (_capturingState == true) then {
    if (_isCapturing == false) then {
      _captureStartTime = diag_tickTime;
      _isCapturing = _capturingState;

      if (_captureTime > 0) then {
				if (_enableNotifications == true) then {
					[
						format ["Начат захват %1", _zoneName],
						format ["Осталось %1 секунд!", _captureTime]
					] remoteExec ["AFG_fnc_showTaskNotification", 0];
				};

				if (_enableBlinking == true) then {
	        [_prevailingSideColor, _marker] spawn AFG_fnc_blinkMarker;
				};
        missionNamespace setVariable [_marker + "_capturingInProgress", true];
        missionNamespace setVariable [_marker + "_zoneCapturedSuccesfully", false];
      };
    };

    if (diag_tickTime - _captureStartTime >= _captureTime) then {
			missionNamespace setVariable [_marker + "_pointOwner", str _prevailingSide];
    	missionNamespace setVariable [_marker + "_blinkingMarker", false];

			_marker setMarkerColor _prevailingSideColor;

			if (_enableNotifications == true) then {
				[
					"",
					_capturedMessage,
					"captured",
					_prevailingSide
				] remoteExec ["AFG_fnc_showTaskNotification", 0];
			};

      if (_isCanBeRecaptured == false) then {
        _isFinished = true;
      };

      missionNamespace setVariable [_marker + "_capturingInProgress", false];
      missionNamespace setVariable [_marker + "_zoneCapturedSuccesfully", true];
    };
	} else {
    _captureStartTime = -1;
    _isCapturing = false;

		if (
			missionNamespace getVariable [_marker + "_capturingInProgress", false]
			&& !(missionNamespace getVariable [_marker + "_zoneCapturedSuccesfully", false])
		) then {
			if (_enableNotifications == true) then {
				[
					"",
					"Захват зоны прерван",
					"aborted"
				] remoteExec ["AFG_fnc_showTaskNotification", 0];
			};
      missionNamespace setVariable [_marker + "_capturingInProgress", false];
		};

  	missionNamespace setVariable [_marker + "_blinkingMarker", false];
	};

	if (_debug == true) then {
		diag_log text "---------------------------------------------------------";
	};

	sleep 3;
};

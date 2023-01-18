params ["_missionTime", "_winningSide", "_winningMessage"];

waitUntil { sleep 3; a3a_var_started };

_missionEndTime = _missionTime * 60;
_srv_gameStart = diag_tickTime;

while { isNil "srv_triggerFinished" } do {
	if (((diag_tickTime - _srv_gameStart) > _missionEndTime)) then {
		srv_triggerFinished = true;
		[_winningMessage, _winningSide] call a3a_fnc_endMission;
	};

	sleep 1;
};

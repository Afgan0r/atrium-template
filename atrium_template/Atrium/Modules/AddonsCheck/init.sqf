if (!isDedicated) then {
	waitUntil { sleep 1.217; !isNil "a3ru_addons_check" };

	{
		if (!isClass (configFile >> "CfgPatches" >> _x)) then {
			"Addon is missing" hintC ["Required addon is missing:" + _x];
			sleep 3;
			failMission "loser";
		};
	} forEach a3ru_addons_check;
};

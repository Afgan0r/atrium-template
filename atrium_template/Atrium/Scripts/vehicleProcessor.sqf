params ["_vehicle", "_folderName", "_fileName"];

_common_processor = {
	params ["_veh"];

	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
};

if (isServer) then {
	_vehicle call _common_processor;
	_vehicle call compile format ["_this call compile preprocessFileLineNumbers 'Equipment\%1\%2.sqf';", _folderName, _fileName];
};
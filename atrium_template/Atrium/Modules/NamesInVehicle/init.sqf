// Показывать имена игроков в транспортных средствах на колесо мыши вверх
if (!isDedicated) then {
	waitUntil { sleep 1.617; a3a_var_cli_postInit };
	a3ru_mod_fnc_namesInVehicle = compile preprocessFileLineNumbers "A3A_MODULES\NamesInVehicle\fn_namesInVehicle.sqf";
	(findDisplay 46) displayAddEventHandler ["MouseZChanged", "if ((_this select 1) > 0) then { [] spawn a3ru_mod_fnc_namesInVehicle }"];
};
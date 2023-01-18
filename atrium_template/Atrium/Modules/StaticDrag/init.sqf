if (!isDedicated) then {
	// Переменные
	a3ru_var_static_rotate = false;
	a3ru_var_static_release = false;
	a3ru_var_static_dragging = false;
	a3ru_var_dragObject = objNull;
	a3ru_var_static_helper = objNull;

	// Функции
	a3ru_mod_fnc_staticCanDrag = compile preprocessFileLineNumbers "A3A_MODULES\StaticDrag\fn_staticCanDrag.sqf";
	a3ru_mod_fnc_staticRotate = compile preprocessFileLineNumbers "A3A_MODULES\StaticDrag\fn_staticRotate.sqf";
	a3ru_mod_fnc_staticRelease = compile preprocessFileLineNumbers "A3A_MODULES\StaticDrag\fn_staticRelease.sqf";
	a3ru_mod_fnc_staticDrag = compile preprocessFileLineNumbers "A3A_MODULES\StaticDrag\fn_staticDrag.sqf";

	waitUntil { sleep 5; a3a_var_cli_postInit };

	// Animation stuck fix
	if (animationState player == "acinpknlmstpsraswrfldnon") then {
		player playMove "amovpknlmstpsraswrfldnon";
	};

	a3ru_module_fnc_dogTag_onKeyDown = compile preprocessFileLineNumbers "A3A_MODULES\StaticDrag\fn_onKeyDown.sqf";
	a3ru_DEH_dogTag = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call a3ru_module_fnc_dogTag_onKeyDown"];
	
	(findDisplay 46) displayAddEventHandler ["MouseZChanged", "(_this select 1) spawn a3ru_mod_fnc_staticRotate"];

	[] spawn {
		private ["_entities", "_entity", "_actionAdded"];
		while {alive player} do {
			_entities = (position player) nearEntities ["StaticWeapon", 50];
			for "_i" from 0 to ((count _entities) - 1) do {
				_entity = _entities select _i;
				_actionAdded = _entity getVariable ["a3ru_staticAction", false];
				if !(_actionAdded) then {
					_dragger = _entity getVariable ["a3ru_canDrag", objNull];
					if (_dragger == player && a3ru_var_dragObject != _entity) then { detach _entity; _entity setVariable ["a3ru_canDrag", objNull, true]; };
					_entity addAction [format[("<img image=""\A3A_Core\RESOURCES\a3ru_drag_take_icon.paa""/> <t color=""#ffff00"">" + localize "STR_A3RU_drag_take" + "</t>"), getText (configFile >> "CfgVehicles" >> (typeOf _entity) >> "displayName")], { (_this select 0) call a3ru_mod_fnc_staticDrag }, "", 0, false, true, "", "(player == vehicle player) && !a3ru_var_static_dragging && (player distance _target <= 3)"];
					_entity setVariable ["a3ru_staticAction", true, false];
				};
				sleep 0.011;
			};
			sleep 5.817;
		};
	};
};
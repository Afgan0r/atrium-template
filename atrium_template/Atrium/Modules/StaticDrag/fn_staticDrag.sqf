private ["_CT", "_check", "_player", "_posY"];
_CT = _this;
_check = _CT call a3ru_mod_fnc_staticCanDrag;
if (_check) then {
	hint parseText (localize "STR_A3RU_drag_desc");
	a3ru_var_static_rotate = false;
	a3ru_var_static_release = false;
	a3ru_var_static_dragging = true;
	_player = player;
	a3ru_var_dragObject = _CT;
	_posY = ((boundingBoxReal _CT) select 1) select 2;
	_CT setVariable ["a3ru_canDrag", player, true];
	//if (a3a_var_started) then { _CT lock 2 };
	_player playMove "acinpknlmstpsraswrfldnon"; // \A3\anims_f\Data\Anim\Sdr\inj\AcinPknlMwlkSlowWrflDb_still
	_CT attachTo [_player, [0, 2, _posY]];
	
	// Помощник
	a3ru_var_static_helper = "Sign_Arrow_Direction_Green_F" createVehicleLocal (position _CT);
	a3ru_var_static_helper attachTo [_CT, [0,0,0 - (_posY / 2)]];
	
	a3ru_KeyEH_releaseStatic = _player addAction [format[("<img image=""\A3A_Core\RESOURCES\a3ru_drag_release_icon.paa""/> <t color=""#ff0000"">" + localize "STR_A3RU_drag_release" + "</t>"), getText (configFile >> "CfgVehicles" >> (typeOf _CT) >> "displayName")], { a3ru_var_static_release = true }, "", 0, false, true, "", "!(isNull a3ru_var_dragObject) && (player == vehicle player)"];
	
	waitUntil { sleep 0.012; (isNull a3ru_var_dragObject) || !alive player || (player != vehicle player) || a3ru_var_static_release || (count (crew _CT) > 0) };
	[] call a3ru_mod_fnc_staticRelease;
};
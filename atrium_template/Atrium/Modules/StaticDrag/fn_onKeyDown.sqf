if !(alive player) exitWith {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", a3ru_DEH_dogTag];
};

// Нажата клавиша Ctrl
if (_this select 3) then { a3ru_var_static_rotate = true };

false
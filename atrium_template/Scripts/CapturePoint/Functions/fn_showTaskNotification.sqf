params ["_title", "_text", ["_type", ""], ["_side", sideLogic]];

_notificationType = "AFGTaskAssigned";

switch (_type) do {
	case "assigned": { _notificationType = "AFGTaskAssigned" };
	case "aborted": { _notificationType = "AFGTaskCanceled" };
	case "captured": {
		if (playerSide == _side) then {
			_notificationType = "AFGTaskSucceeded";
		} else {
			_notificationType = "AFGTaskFailed";
		};
	};
	default { _notificationType = "AFGTaskAssigned" };
};

[_notificationType, [_title, _text]] call bis_fnc_showNotification;

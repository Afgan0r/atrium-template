/*
 * Author: Afgan0r
 * Used to show notifications.
 *
 * Arguments:
 * 0: Title in the notification <STRING>
 * 1: Text in the notification <STRING>
 * 2: Type of the notification. Can be: "assigned", "aborted", "captured", "". Default: "" <STRING>
 * 3: Which side's players will see the succeeded task. Players of the other sides will see failed task <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["", "Захват зоны прерван", "aborted"] call "AFG_fnc_showTaskNotification"
 * ["", "Зона захвачена", "captured", east] call "AFG_fnc_showTaskNotification"
 *
 * Only server: No
*/

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

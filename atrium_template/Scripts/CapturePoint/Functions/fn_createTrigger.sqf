/*
 * Author: Ezhuk, WOG
 * Adapted, refactored and improved: Afgan0r
 * Used to create trigger. Trigger only user for getting units list.
 *
 * Arguments:
 * 0: Marker name <STRING>
 *
 * Return Value:
 * Trigger var name <OBJECT>
 *
 * Example:
 * "marker_name" call AFG_fnc_createTrigger
 *
 * Only server: Yes
*/

params ["_marker"];

_position = markerPos _marker;
_dir = markerDir _marker;
_size = markerSize _marker;
_isRectangle = (markerShape _marker) == "RECTANGLE";

_trigger = createTrigger ["EmptyDetector", [_position # 0, _position # 1], false];
_trigger setTriggerArea [_size # 0, _size # 1, _dir, _isRectangle];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements ["this", "", ""];
_trigger setTriggerInterval 1;
_trigger

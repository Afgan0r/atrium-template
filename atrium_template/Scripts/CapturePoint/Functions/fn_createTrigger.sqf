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

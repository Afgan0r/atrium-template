/*
 * Author: Ezhuk, WOG
 * Adapted, refactored and improved: Afgan0r
 * Used to get marker by side.
 *
 * Arguments:
 * 0: Side <STRING>
 *
 * Return Value:
 * Marker color <STRING>
 *
 * Example:
 * "WEST" call AFG_fnc_getColorBySide
 *
 * Only server: No
*/

params ["_side"];

_color = "ColorBlack";

switch (_side) do {
	case "WEST": { _color = "ColorBlufor" };
	case "EAST": { _color = "ColorOpfor" };
	case "GUER": { _color = "ColorIndependent" };
	case "CIV": { _color = "ColorCivilian" };
};

_color

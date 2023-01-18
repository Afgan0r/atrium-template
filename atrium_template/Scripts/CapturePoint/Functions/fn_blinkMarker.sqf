/*
 * Author: Ezhuk, WOG
 * Adapted, refactored and improved: Afgan0r
 * Used to start blinking the marker.
 *
 * Arguments:
 * 0: Color of the blinking marker. Should be color of the prevailing side <STRING>
 * 1: Marker name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ColorBlufor", "marker_name"] spawn AFG_fnc_blinkMarker
 *
 * Only server: Yes
*/

params ["_color", "_marker"];

missionNamespace setVariable [_marker + "_blinkingMarker", true];

private _originalMarkerParams = [markerAlpha _marker, markerBrush _marker];

_marker setMarkerBrush "FDiagonal";
_marker setMarkerColor _color;

while { missionNamespace getVariable [_marker + "_blinkingMarker", false] } do {
  _marker setMarkerAlpha 1;
  sleep 0.4;

  _marker setMarkerAlpha 0;
  sleep 0.4;
};

_currentOwner = missionNamespace getVariable [_marker + "_pointOwner", ""];
_markerOwnerColor = _currentOwner call AFG_fnc_getColorBySide;

_marker setMarkerAlpha (_originalMarkerParams # 0);
_marker setMarkerBrush (_originalMarkerParams # 1);
_marker setMarkerColor _markerOwnerColor;

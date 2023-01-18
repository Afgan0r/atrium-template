params ["_side"];

_color = "ColorBlack";

switch (_side) do {
	case "WEST": { _color = "ColorBlufor" };
	case "EAST": { _color = "ColorOpfor" };
	case "GUER": { _color = "ColorIndependent" };
	case "CIV": { _color = "ColorCivilian" };
};

_color

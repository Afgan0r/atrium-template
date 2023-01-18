#define a3ru_icon_driver "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa"
#define a3ru_icon_commander "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
#define a3ru_icon_gunner "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa"
#define a3ru_icon_cargo "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa"
#define a3ru_color_blue "#0000ff"
#define a3ru_color_red "#ff0000"
#define a3ru_color_white "#ffffff"
#define a3ru_color_green "#12be00"

// Показывать игроков в технике
_vehicle = vehicle player;
if (player != _vehicle) then {
	_color = a3ru_color_white;
	_vehName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	_vehSide = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "faction");
	switch (_vehSide) do {
		case "BLU_F": { _color = a3ru_color_blue };
		case "OPF_F": { _color = a3ru_color_red };
		case "IND_F": { _color = a3ru_color_green };
	};
	_output = format["<t size='1.2' color='%1'> %2 </t><br/><t align='left'>", _color, _vehName];
	{
		_icon = a3ru_icon_cargo;
		_additional = "";
		if (driver _vehicle == _x) then {
			_icon = a3ru_icon_driver;
		};
		if (gunner _vehicle == _x) then {
			_icon = a3ru_icon_gunner;
		};
		if (commander _vehicle == _x) then {
			_icon = a3ru_icon_commander;
		};
		if !(isPlayer _x) then { _additional = "[AI] " };
		if (_x == player) then {
			_output = _output + format['<img image="%1"/> <t color="#ffff00">%3</t><br/>', _icon, _additional, name _x];
		} else {
			_output = _output + format['<img image="%1"/> %2%3<br/>', _icon, _additional, name _x];
		};
	} forEach (crew _vehicle);
	hintSilent parseText (_output + "</t>");
};
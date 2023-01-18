//Скрипт на запрет снятия экипировки

_inventoryDisplay = 602;

waitUntil {!(isNull (findDisplay _inventoryDisplay))};

while {!(isNull (findDisplay _inventoryDisplay))} do {
	{
		ctrlEnable [_x, false];
	} forEach [
		// 6240, // Головной убор
		// 6216, // Очки
		6331 // Униформа
	];
};
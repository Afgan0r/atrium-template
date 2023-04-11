_addMedicineToUnit = {
	params ["_unit"];

	// В этом файле указывается количество медицины, которое необходимо выдать всем игрокам
	// Будьте аккуратны т.к. команда addItemCargoGlobal выдает снаряжение даже если контейнер уже полный

	_uniform = uniformContainer _unit;
	_vest = vestContainer _unit;
	_backpack = backpackContainer _unit;

	// Снаряжение, выдаваемое всем игрокам в униформу
	// Если хотите выдать не в униформу, то поменяйте _uniform на _vest (разгрузка) или _backpack (рюкзак)
	_uniform addItemCargoGlobal ["ACE_quikclot", 3];
	_uniform addItemCargoGlobal ["ACE_fieldDressing", 3]; // обычный бинт
	_uniform addItemCargoGlobal ["ACE_elasticBandage", 3]; // давящий бинт
	_uniform addItemCargoGlobal ["ACE_packingBandage", 3]; // тампонирующий
	_uniform addItemCargoGlobal ["ACE_morphine", 2];
	_uniform addItemCargoGlobal ["ACE_tourniquet", 1]; // жгут
	_uniform addItemCargoGlobal ["ACE_epinephrine", 2]; // адреналин
	_uniform addItemCargoGlobal ["ACE_EarPlugs", 1]; // беруши

	_medicClass = _unit getVariable ["ace_medical_medicClass", 0];

	// Добавление медицины медикам
	if (_medicClass > 0) then {
		// убрать если у медика в рюкзаке должно быть что-то кроме медицины
		clearItemCargoGlobal _backpack;
		clearMagazineCargoGlobal _backpack;
		clearWeaponCargoGlobal _backpack;
		// убрать если у медика в рюкзаке должно быть что-то кроме медицины

		// здесь _backpack также можно заменить на _vest или _uniform
		_backpack addItemCargoGlobal ["ACE_fieldDressing", 10]; // обычный бинт
		_backpack addItemCargoGlobal ["ACE_elasticBandage", 10]; // давящий бинт
		_backpack addItemCargoGlobal ["ACE_packingBandage", 10]; // тампонирующий
		_backpack addItemCargoGlobal ["ACE_quikclot", 10];
		_backpack addItemCargoGlobal ["ACE_epinephrine", 10]; // адреналин
		_backpack addItemCargoGlobal ["ACE_morphine", 10];
		_backpack addItemCargoGlobal ["ACE_salineIV_500", 5]; // Физраствор 500 мл
		_backpack addItemCargoGlobal ["ACE_surgicalKit", 1]; // Хир. набор
		_backpack addItemCargoGlobal ["ACE_personalAidKit", 5]; // Аптечки
	};
};

_playableUnitsList = playableUnits;

if (!isMultiplayer) then { _playableUnitsList = switchableUnits; };

{ [_x] spawn _addMedicineToUnit } forEach _playableUnitsList;

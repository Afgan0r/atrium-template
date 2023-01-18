// аналог initServer.sqf

{ [_x] execVM "Scripts\addMedicine.sqf"; } forEach playableUnits;

// Параметры для завершения миссии по времени
_missionTime = 90; // время миссии в минутах
_winningSide = blufor; // сторона которая выиграет по окончанию, может быть blufor/opfor/independent
_winningMessage = "Время истекло. Победа обороны!"; // Сообщение которое показывается по окончанию миссии

[_missionTime, _winningSide, _winningMessage] spawn ATRIUM_fnc_timeout;

// Параметры для завершения миссии по потерям
_bluforThreshold = 7; // минимальное количество живых синих юнитов
_bluforMessage = "Синие понесли тяжелые потери и сдались!"; // сообщение если проиграли синие
_bluforEnemySide = opfor; // кто выигрывает в случае больших потерь синих

_opforThreshold = 7; // минимальное количество живых красных юнитов
_opforMessage = "Красные понесли тяжелые потери и сдались!"; // сообщение если проиграли красные
_opforEnemySide = blufor; // кто выигрывает в случае больших потерь красных

_independentThreshold = 0; // минимальное количество живых зеленых юнитов
_independentMessage = "Зеленые понесли тяжелые потери и сдались!"; // сообщение если проиграли зеленые
_independentEnemySide = blufor; // кто выигрывает в случае больших потерь синих

[
	_bluforThreshold, _bluforMessage, _bluforEnemySide,
	_opforThreshold, _opforMessage, _opforEnemySide,
	_independentThreshold, _independentMessage, _independentEnemySide
] spawn ATRIUM_fnc_endByLoss;

// включение скрипты на захват зон
// [] spawn AFG_fnc_initCapturePoint;

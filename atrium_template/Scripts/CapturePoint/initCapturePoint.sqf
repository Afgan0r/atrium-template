[
	"trigger_1", // название маркера
	west, // сторона которая владеет зоной на старте
	5, // время захвата в секундах
	"базы боевиков", // название зоны, которое будет отображено в нотификациях, текст перед названием зоны "Начат захват ..."
	"База боевиков была захвачена!", // текст, который будет показан в нотификациях после захвата
	true, // включить возможность перезахвата зоны
	false, // включить легкий захват
	-10, // минимальная высота
	30, // максимальная высота
	1.5, // превосходство атакующих над обороняющимися
	3, // минимальное количество атакующих юнитов для начала захвата
	4, // максимальное количество обороняющихся юнитов для недопуска захвата зоны
	false, // включить мигание маркера при захвате
	false, // включить нотификации
	false // включение режима отладки
] spawn AFG_fnc_zoneInit;

_zones = createHashMap;
// для каждой зоны нужна отдельная команда set
_zones set ["trigger_1", east]; // [название маркера, какая сторона должна владеть зоной для победы]
_minimumZonesCaptured = 1; // сколько зон должно быть захвачено для победы
_winningSide = east; // сторона, которая побеждает при захвате требуемого количества зон
_winningMessage = "Красная сторона захватила все базы!"; // сообщение, которое показывается при захвате требуемого количества зон

[_zones, _minimumZonesCaptured, _winningSide, _winningMessage] spawn AFG_fnc_endMission;

// Используется если нужно указать что-то дополнительно в брифинге
// т.к. изначально структура брифинга строго одинаковая это может быть полезно
switch (side player) do {
	case east: {
		// player createDiaryRecord ["diary", ["Заголовок", loadFile "A3A_BRIEFING\briefing_filename.html"]];
	};
	case west: {
		// player createDiaryRecord ["diary", ["Заголовок", loadFile "A3A_BRIEFING\briefing_filename.html"]];
	};
	case independent: {
		// player createDiaryRecord ["diary", ["Заголовок", loadFile "A3A_BRIEFING\briefing_filename.html"]];
	};
};

enableSaving [false, false]; // отключение сохранение
setTerrainGrid 3.125; // отрисовка ландшафта, читайте - https://community.bistudio.com/wiki/setTerrainGrid

sleep 0.1;
enableEnvironment [false, true]; // удаление всей окружающей фауны, звуки остаются

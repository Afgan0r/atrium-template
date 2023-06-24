// Используется если нужно указать что-то дополнительно в брифинге
// т.к. изначально структура брифинга строго одинаковая это может быть полезно

// брифинг для всех игроков
player createDiaryRecord ["diary", [localize "STR_AFG_Uniform_Briefing", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];

switch (side player) do {
	// для красных
	case east: {
		// player createDiaryRecord ["diary", ["Заголовок", loadFile "A3A_BRIEFING\briefing_FILENAME.html"]];
	};
	// для синих
	case west: {
		// player createDiaryRecord ["diary", ["Заголовок", loadFile "A3A_BRIEFING\briefing_FILENAME.html"]];
	};
	// для зеленых
	case independent: {
		// player createDiaryRecord ["diary", ["Заголовок", loadFile "A3A_BRIEFING\briefing_FILENAME.html"]];
	};
};

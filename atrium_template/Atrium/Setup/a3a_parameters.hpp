class Params {
	class a3a_params_startTime {
		title = "$STR_A3RU_startTime";
		values[] = {0000, 0001, 0030, 0100, 0130, 0200, 0230, 0300, 0330, 0400, 0430, 0500, 0530, 0600, 0630, 0700, 0730, 0800, 0830, 0900, 0930, 1000, 1030, 1100, 1130, 1200, 1230, 1300, 1330, 1400, 1430, 1500, 1530, 1600, 1630, 1700, 1730, 1800, 1830, 1900, 1930, 2000, 2030, 2100, 2130, 2200, 2230, 2300, 2330};
		texts[] = {$STR_A3RU_default, "00:00", "00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"};
		default = 0000; // по умолчанию берется из настроек окружения в редакторе; можно поменять на любое значение из values[]
	};
	class a3a_params_startFog {
		title = "$STR_A3RU_startFog";
		values[] = {0, 1, 2, 3, 4};
		texts[] = {$STR_A3RU_Default, "1", "2", "3", "4"}; // у названий временно ублюдские названия, будет поправлено позже
		default = 0;
	};
	class a3a_params_preTime {
		title = "$STR_A3RU_preTime";
		values[] = {60, 300, 420, 600, 900, 1200, 1500, 1800};
		texts[] = {"1m", "5m", "7m", "10m", "15m", "20m", "25m", "30m"};
		default = 900; // время фризтайма; для mace - 300 (5 минут), для SG - 900 (15 минут)
	};
	class a3a_params_slotReservation {
		title = "$STR_A3RU_slotReservation";
		values[] = {0,1};
		texts[] = {$STR_A3RU_off,$STR_A3RU_on};
		default = 0;
	};
	class a3a_params_spectatorSides {
		title = "$STR_A3RU_spectatorSides";
		values[] = {0,1};
		texts[] = {$STR_A3RU_spectatorOwnSide, $STR_A3RU_spectatorAllSides};
		default = 1;
	};
	class a3a_params_externalAddonsInit {
		title = "$STR_A3RU_externalAddonsInit";
		values[] = {0,1};
		texts[] = {$STR_A3RU_off, $STR_A3RU_on};
		default = 1;
	};
};
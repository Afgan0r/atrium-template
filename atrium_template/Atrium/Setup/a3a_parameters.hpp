class Params {
	class a3a_params_startTime {
		title = "$STR_A3RU_startTime";
		values[] = {0};
		texts[] = {$STR_A3RU_default};
		default = 0;
	};
	class a3a_params_startFog {
		title = "$STR_A3RU_startFog";
		values[] = {0};
		texts[] = {$STR_A3RU_Default};
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
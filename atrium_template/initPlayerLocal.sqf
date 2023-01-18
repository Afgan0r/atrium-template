enableSaving [false, false]; // отключение сохранение
setTerrainGrid 3.125; // отрисовка ландшафта читайте - https://community.bistudio.com/wiki/setTerrainGrid

// Подключение модулей
#include "Atrium\Setup\a3a_modules.hpp"
{ [] execVM "Atrium\Modules\" + _x + "\init.sqf"; } forEach A3A_MODULES;

sleep 0.1;
enableEnvironment [false, true]; // удаление всей окружающей фауны, звуки остаются

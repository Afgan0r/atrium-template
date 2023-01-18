class AtriumFuncs {
	tag = "ATRIUM";

	class MissionComplete {
		file = "Atrium\Scripts\MissionComplete";

		class timeout {};
		class endByLoss {};
	};

	class MiscScripts {
		file = "Atrium\Scripts";

		class preInit {
			preInit=1;
      postInit=0;
		};
	};
};

class CfgNotifications {
	class AFGTaskAssigned {
		title = "%1";
		description = "%2";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		priority = 5;
		sound = "taskAssigned";
	};
	class AFGTaskCanceled {
		title = "%1";
		description = "%2";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_ca.paa";
		priority = 6;
		sound = "taskCanceled";
		color[] = {0.7 ,0.7, 0.7, 1};
	};
	class AFGTaskSucceeded {
		title = "%1";
		description = "%2";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
		priority = 6;
		sound = "taskSucceeded";
		color[] = {0.7, 1, 0.3, 1};
	};
	class AFGTaskFailed {
		title = "%1";
		description = "%2";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
		priority = 6;
		sound = "taskFailed";
		color[] = {1,0.3,0.2,1};
	};
}

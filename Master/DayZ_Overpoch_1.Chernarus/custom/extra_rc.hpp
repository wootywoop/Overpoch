class ExtraRc {
	class ItemBriefcase_Base {
		class OpenSurpriseBrief {
			text = "Open Briefcase";
			script = "execVM 'addons\mbc\open_brief.sqf'";
		};
	};
	class ItemRadio {
        class switchOnOff {
            text = "Switch ON/OFF";
            script = "execVM 'custom\remote\switch_on_off.sqf'";
        };
    };
	class ItemRadio {
     class GroupManagement {
        text = "Group Management";
        script = "execVM 'dzgm\loadGroupManagement.sqf'";
		};
	};
};
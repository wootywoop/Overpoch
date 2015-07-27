class ExtraRc {
	class 30m_plot_kit {
		class Test1 {
			text = "Test 1";
			script = "hint ""Test 1 was clicked!"";";
		};
		class Test2 {
			text = "Test 2";
			script = "hint ""Test 1 was clicked!"";";
		};
	};
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
};
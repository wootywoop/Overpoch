if (isNil "custom_monitor") then {custom_monitor = true;} else {custom_monitor = !custom_monitor;};

while {custom_monitor} do 
{
	_kills = 		player getVariable["zombieKills",0];
	_killsH = 		player getVariable["humanKills",0];
	_killsB = 		player getVariable["banditKills",0];
	_humanity =		player getVariable["humanity",0];
	_headShots = 	player getVariable["headShots",0];
	hintSilent parseText format ["
	<t size='2'font='Bitstream'align='center'>%1</t><br/>
	<t size='1'font='Bitstream'align='left'>Blood:</t><t size='1' font='Bitstream'align='right'>%2</t><br/>
	<t size='1'font='Bitstream'align='left'>Humanity:</t><t size='1'font='Bitstream'align='right'>%3</t><br/>
	<t size='1'font='Bitstream'align='left'>Murders:</t><t size='1'font='Bitstream'align='right'>%4</t><br/>
	<t size='1'font='Bitstream'align='left'>Bandits Killed:</t><t size='1'font='Bitstream'align='right'>%5</t><br/>
	<t size='1'font='Bitstream'align='left'>Zombies Killed:</t><t size='1'font='Bitstream'align='right'>%6</t><br/>
	<t size='1'font='Bitstream'align='left'>Headshots:</t><t size='1'font='Bitstream'align='right'>%7</t><br/>
	<t size='1.5'font='Bitstream'align='center'>GamingDeluxe.co.uk</t><br/>

	",(str(name player)),r_player_blood,round _humanity,_killsH,_killsB,_kills,_headShots];
sleep 1;
};


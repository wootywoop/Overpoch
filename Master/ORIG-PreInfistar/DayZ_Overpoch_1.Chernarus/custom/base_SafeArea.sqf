//---------------------------------------------------------------------
// Epoch Base Safe Area
// By MadMartyr
// Modified from generic ZombieShield code by felixberndt and meat
// http://opendayz.net/threads/prevent-zombie-spawning.8799/#post-32461
//---------------------------------------------------------------------


while {true} do {
  sleep 10;


  // No Zeds near Plot Poles
  _playerPos = getPos player;
  _nearPole = nearestObject [_playerPos, "Plastic_Pole_EP1_DZ"];
  if (!isNull _nearPole) then {
    _pos2 = getPos _nearPole;
    _zombies2 = _pos2 nearEntities ["zZombie_Base", dayz_poleSafeArea];
    _count2 = count _zombies2;
    for "_i" from 0 to (_count2 -1) do
    {
      _zombie2 = _zombies2 select _i;
      _zombie2 setDamage 1;
    };
  };
};
///scrFlipGrav(refresh,spd)
/// refresh : 0, 1, 2    0 not refresh, 1 refresh one, 2 refresh all
/// spd : 0, 1           0 speed is 0, 1 maintain speed
///flips the current gravity

var arg0 = argument0;
var arg1 = argument1;

// set gravity
global.grav = -global.grav;

// flip the player
with (objPlayer)
{
    if (arg0 == 1) djump = min(global.jump - 1, djump + 1);
    else if(arg0 == 2) djump = global.jump - 1;
    
    if (arg1 == 0) vspeed = 0;
    
    jump = abs(jump) * global.grav;
    jump2 = abs(jump2) * global.grav;
    gravity = abs(gravity) * global.grav;
    
    scrSetPlayerMask();
    
    y += 4 * global.grav;
}

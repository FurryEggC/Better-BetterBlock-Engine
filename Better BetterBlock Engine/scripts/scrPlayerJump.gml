if (place_meeting(x,y+(global.grav),objBlock) || onPlatform || place_meeting(x,y+(global.grav),objWater))
{
    vspeed = -jump;
    if place_meeting(x,y+(global.grav),objTouchMovingPlatform) {
        with instance_place(x,y+(global.grav),objTouchMovingPlatform) {
            if (jumps != -1) other.djump = jumps;
            else other.djump = global.jump - 1;
        }
    }
    else if place_meeting(x,y+(global.grav),objTouchMovingFakePlatformParent) {
        with instance_place(x,y+(global.grav),objTouchMovingFakePlatformParent) {
            if (jumps != -1) other.djump = jumps;
            else other.djump = global.jump - 1;
            event_user(0);  // delete other
        }
    }
    djump = global.jump - 1;
    audio_play_sound(sndJump,0,false);
}
else if (djump >= 1 || place_meeting(x,y+(global.grav),objWater2) || (global.infJump || global.debugInfJump))
{
    vspeed = -jump2;
    sprite_index = sprPlayerJump;
    audio_play_sound(sndDJump,0,false);
    
    if (!place_meeting(x,y+(global.grav),objWater3)) djump = max(djump - 1, 0);  // take away one jump
    else djump = global.jump - 1;  // replenish djump if touching water3
}

if (onPlatform || place_meeting(x,y+(global.grav),objBlock) 
               || place_meeting(x,y+(global.grav),objWater)) {
    vspeed = -jump;
    audio_play_sound(sndJump,0,false);
    
    djump = global.jump - 1;  // refresh all jumps
    
    /// Touch Moving (Fake) Platform (Parent)
    if place_meeting(x,y+(global.grav),objTouchMovingPlatform) {
        with instance_place(x,y+(global.grav),objTouchMovingPlatform) {
            if (jumps != -1) {
                // refresh jumps from platform's jumps
                other.djump = jumps;
            }
            // else, refresh jumps num from platform's jumps (line 6)
        }
    } else if place_meeting(x,y+(global.grav),objTouchMovingFakePlatformParent) {
        with instance_place(x,y+(global.grav),objTouchMovingFakePlatformParent) {
            if (jumps != -1) {
                // refresh jumps from platform's jumps
                other.djump = jumps;
            }
            // else, refresh jumps num from platform's jumps (line 6)
            event_user(0);  // delete other
        }
    }
}
else if (djump >= 1 || place_meeting(x,y+(global.grav),objWater2) 
                    || (global.infJump || global.debugInfJump)) {
    vspeed = -jump2;
    audio_play_sound(sndDJump,0,false);
    
    djump = max(djump - 1, 0);  // take away one jump
    
    if (place_meeting(x,y+(global.grav),objWater3)) {
        // refresh jumps
        djump = global.jump - 1;
    }
}

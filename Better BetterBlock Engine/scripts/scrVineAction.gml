/// scrVineAction()
var notOnBlock = (place_free(x,y+(global.grav)) && !instance_exists(riding));
var onVineL = (place_meeting(x-1,y,objWalljumpL) && notOnBlock);
var onVineR = (place_meeting(x+1,y,objWalljumpR) && notOnBlock);

var collisionObj;

if (onVineL || onVineR)
{
    if (onVineR) {
        xScale = -1;
        collisionObj = instance_place(x+1,y,objWalljumpR);
    }
    else {
        xScale = 1;
        collisionObj = instance_place(x-1,y,objWalljumpL);
    }
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    image_speed = 1/2;
    
    //pressed away from the vine
    if (onVineL && scrButtonCheckPressed(global.rightButton)) || (onVineR && scrButtonCheckPressed(global.leftButton)) {
        // jumping off vine
        if (scrButtonCheck(global.jumpButton)) {
            if (onVineR) hspeed = -15;
            else hspeed = 15;
            
            if (collisionObj.refresh) djump = min(djump + 1, global.jump - 1);
            with collisionObj if once event_user(0);  // destory the vine
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
        }
        else {  // moving off vine
            if (onVineR) hspeed = -3;
            else hspeed = 3;
            
            if (collisionObj.refresh && collisionObj.kind) djump = min(djump + 1, global.jump - 1);
            sprite_index = sprPlayerFall;
        }
    }
}

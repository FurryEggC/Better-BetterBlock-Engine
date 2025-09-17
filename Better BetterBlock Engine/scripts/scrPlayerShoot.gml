if (instance_number(objBullet) < bulletMax) {
    with instance_create(x - xScale * bulletSpd,y,objBullet) hspeed = other.xScale * other.bulletSpd;
    audio_play_sound(sndShoot,0,false);
}


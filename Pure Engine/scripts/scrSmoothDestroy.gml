/// scrSmoothDestroy(id, time)

var i = argument0;

with i {
    with instance_create(x, y, objAnimationDisappear) {
        xs = other.image_xscale;
        ys = other.image_yscale;
        rot = other.image_angle;
        spr = other.sprite_index;
        time = argument1;
        depth = other.depth;
        image_speed = other.image_speed;
        vspeed = other.vspeed;
        hspeed = other.hspeed;
    }
    instance_destroy();
}


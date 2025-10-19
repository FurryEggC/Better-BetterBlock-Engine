/// scrSmoothCreateInstant(x, y, obj, time)
// returns created object

var cx = argument0;
var cy = argument1;
var co = argument2;
var t = argument3;

var i = instance_create(cx, cy, co);
with i {
    image_alpha = 0;
    with instance_create(cx, cy, objAnimationAppear) {
        ct = t;
        obj = i;
    }
}

return i;


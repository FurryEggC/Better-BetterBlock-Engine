/// scrCreateMoving(x, y, obj, dir, spd)
/// returns the id of created object
xs = argument0;
ys = argument1;
obj = argument2;
dir = argument3;
spd = argument4;


var to_create = instance_create(xs, ys, obj);
with to_create {
    direction = other.dir;
    speed = other.spd;
}
return to_create;


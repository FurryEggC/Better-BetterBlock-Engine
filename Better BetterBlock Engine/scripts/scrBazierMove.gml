/// scrBazierMove(t,dir,len,pr1,pr2,sx,sy)

var t = argument0;
var dir = argument1;
var len = argument2;
var pr1 = argument3;
var pr2 = argument4;

var sx, sy;
if (argument_count == 7) {
    sx = argument5;
    sy = argument6;
}
else {
    sx = xstart;
    sy = ystart;
}

var bazierValue;
bazierValue =  3 * t * (1 - t) * (1 - t) * pr1 + 3 * (t * t) * (1 - t) * pr2 + t * t * t;

var xOff = lengthdir_x(len * bazierValue, dir);
var yOff = lengthdir_y(len * bazierValue, dir);

x = xs + xOff; y = ys + yOff;


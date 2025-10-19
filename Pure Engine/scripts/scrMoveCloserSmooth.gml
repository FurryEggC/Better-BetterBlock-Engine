/// scrMoveCloserSmooth(xPos, yPos, spd)
// let a object get closer to xPos, yPos (use in step event)
// the smaller spd is, the smoother it will be

var xPos = argument0;
var yPos = argument1;
var spd = argument2;

x += (xPos - x) / spd;
y += (yPos - y) / spd;


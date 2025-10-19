/// scrShadeFollow(shade, xOff, yOff)

inst = argument0;
inst.x = x + argument1;
inst.y = y + argument2;
inst.sprite_index = sprite_index;
inst.image_index = image_index;
inst.image_speed = image_speed;
inst.image_angle = image_angle;
inst.image_xscale = image_xscale;
inst.image_yscale = image_yscale;

if (object_index != objBlock) inst.visible = visible;
if (object_index == objPlayer) inst.image_xscale = xScale;



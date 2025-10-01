/// scrCreateShadow(alpha, xOff, yOff)
/// returns shadow object
var inst;
inst = instance_create(x + argument1, y + argument2, objShade);
inst.sprite_index = sprite_index;
inst.image_xscale = image_xscale;
inst.image_yscale = image_yscale;
inst.image_index = image_index;
inst.image_speed = image_speed;
inst.image_angle = image_angle;
inst.visible = visible;
inst.image_blend = c_black;
inst.depth = depth + 1;
inst.image_alpha = argument0;
inst.parent = id;
return inst;

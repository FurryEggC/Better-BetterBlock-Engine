/// scrColorBlendFunction(x)

if argument0 <= 255 return 0;
if argument0 <= 255 + 127 return argument0 - 255;
if argument0 <= 255 * 2 + 127 return 127;
if argument0 <= 255 * 3 return argument0 - 255 * 2;
if argument0 <= 255 * 4 return 255;
if argument0 <= 255 * 5 return 255 * 5 - argument0;
return 0;

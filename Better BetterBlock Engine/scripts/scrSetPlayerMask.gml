/// sets the player's mask depending on gravity flip mode and dotkid mode

if (global.dotkid == 1) {
    if (global.grav == 1) mask_index = sprPlayerMaskDotkid;
    else mask_index = sprPlayerMaskDotkidFlip;
}
else {
    if (global.grav == 1) mask_index = sprPlayerMask;
    else mask_index = sprPlayerMaskFlip;
}



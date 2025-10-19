/// scrToggleDotkid()
/// Turn the player into dotkid

// set dotkid
global.dotkid = 1 - global.dotkid;

// flip the player
with (objPlayer) {
    scrSetPlayerMask();
}


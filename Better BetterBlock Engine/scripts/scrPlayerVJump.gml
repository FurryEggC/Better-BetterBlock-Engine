if (vspeed * global.grav < 0) {
    vspeed *= 0.45;
    
    // Frame Indicator
    if (djump) {
        // release first jump
        fmJump1 = frameCur;
        frameCur = 0;
    } else {
        // release djump
        fmJump2 = frameCur;
        frameCur = 0;
    }
}

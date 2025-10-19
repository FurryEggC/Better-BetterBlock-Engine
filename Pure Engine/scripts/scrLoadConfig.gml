///loads config settings, sets default config if it doesn't exist

ini_open("config.ini");

//settings
global.muteMusic = ini_read_real("Settings","Mute_music",false);

global.volumeLevel = clamp(floor(ini_read_real("Settings","Volume_level",100)),0,100);
audio_master_gain(global.volumeLevel/100);

global.fullscreenMode = ini_read_real("Settings","Fullscreen_mode",false);
window_set_fullscreen(global.fullscreenMode);

global.smoothingMode = ini_read_real("Settings","Smoothing_mode",false);

global.vsyncMode = ini_read_real("Settings","Vsync_mode",false);
if (global.vsyncMode)   // only need to set vsync mode if it's on since it's off by default
    scrSetVsync();

// keyboard controls
global.leftButton = ini_read_real("Controls","Left",vk_left);
global.rightButton = ini_read_real("Controls","Right",vk_right);
global.upButton = ini_read_real("Controls","Up",vk_up);
global.downButton = ini_read_real("Controls","Down",vk_down);
global.jumpButton = ini_read_real("Controls","Jump",vk_shift);
global.shootButton = ini_read_real("Controls","Shoot",ord("Z"));
global.restartButton = ini_read_real("Controls","Restart",ord("R"));
global.skipButton = ini_read_real("Controls","Skip",ord("S"));
global.suicideButton = ini_read_real("Controls","Suicide",ord("Q"));
global.pauseButton = ini_read_real("Controls","Pause",ord("P"));
global.alignLeftButton = ini_read_real("Controls","Align_left",ord("A"));
global.alignRightButton = ini_read_real("Controls","Align_right",ord("D"));
// added keyboard controls
global.hubButton = ini_read_real("Controls","Hub",vk_backspace);
global.confirmButton = ini_read_real("Controls","Confirm",vk_enter);
global.bowButton = ini_read_real("Controls","Bow",ord("B"));
global.skinLeftButton = ini_read_real("Controls","Skin_left",ord("1"));
global.skinRightButton = ini_read_real("Controls","Skin_right",ord("2"));
global.gimmickAButton = ini_read_real("Controls","Gimmick_A",ord("X"));
global.gimmickBButton = ini_read_real("Controls","Gimmick_B",ord("C"));
global.gimmickCButton = ini_read_real("Controls","Gimmick_C",ord("V"));

//menu keys (not rebindable)
global.menuLeftButton = vk_left;
global.menuRightButton = vk_right;
global.menuUpButton = vk_up;
global.menuDownButton = vk_down;
global.menuAcceptButton = vk_shift;
global.menuBackButton = ord("Z");
global.menuOptionsButton = vk_enter;

ini_close();

scrSaveConfig();    //save config in case something changed

///initializes all global variables needed for the game

scrSetGlobalOptions();       //initialize global game options

global.savenum = 1;
global.difficulty = 0;  // I wanna delete that
global.death = 0;
global.time = 0;
global.timeMicro = 0;

for (var i = 0; i <= global.stageTotal; i++) {
    global.stageDeath[i] = 0;
    global.stageTime[i] = 0;
}

global.saveRoom = "";
global.savePlayerX = 0;
global.savePlayerY = 0;
global.grav = 1;
global.saveGrav = 1;

global.jump = 2;  // How many jumps could player jump
global.saveJump = 2;
global.skin = 0;  // skin
global.saveSkin = 0;
global.skinBlend = 0;  // skin blend
global.saveSkinBlend = 0;  // skin blend
global.bow = 1;
global.saveBow = 1;

for (var i = global.secretItemTotal-1; i >= 0; i--) {
    global.secretItem[i] = false;
    global.saveSecretItem[i] = false;
}

global.gameClear = false;
global.saveGameClear = false;

global.gameStarted = false;     //determines whether the game is in progress (enables saving, restarting, etc.)
global.noPause = false;         //sets whether or not to allow pausing (useful for bosses to prevent desync)
global.autosave = false;        //keeps track of whether or not to autosave the next time the player is created
global.noDeath = false;         //keeps track of whether to give the player god mode
global.infJump = false;         //keeps track of whether to give the player infinite jump

global.gamePaused = false;      //keeps track of whether the game is paused or not
global.pauseSurf = -1;       //stores the screen surface when the game is paused
global.pauseDelay = 0;      //sets pause delay so that the player can't quickly pause buffer

global.currentMusicID = -1;  //keeps track of what song the current music is
global.currentMusic = -1;    //keeps track of current main music instance
global.deathSound = -1;     //keeps track of death sound when the player dies
global.gameOverMusic = -1;   //keeps track of game over music instance
global.musicFading = false;     //keeps track of whether the music is being currently faded out
global.currentGain = 0;     //keeps track of current track gain when a song is being faded out

global.menuSelectPrev[0] = 0;     //keeps track of the previously selected option when navigating away from the difficulty menu
global.menuSelectPrev[1] = 0;     //keeps track of the previously selected option when navigating away from the options menu

//get the default window size
global.windowWidth = surface_get_width(application_surface);
global.windowHeight = surface_get_height(application_surface);

//keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface));  //set the correct gui size for the Draw GUI event

randomize();    //make sure the game starts with a random seed for RNG


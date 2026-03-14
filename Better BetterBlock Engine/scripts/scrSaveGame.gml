/// scrSaveGame(saveposition, precise)
/// saves the game
/// argument0 - sets whether the game should save the player's current location or just save the deaths/time
/// argument1 - sets whether to save precisely

var savePosition = argument0;
var precise = argument1;

//save the player's current location variables if the script is currently set to (we don't want to save the player's location if we're just updating death/time)
if (savePosition)
{    
    global.saveRoom = room_get_name(room);
    global.savePlayerX = objPlayer.x - objPlayer.hspeed;
    global.savePlayerY = objPlayer.y - objPlayer.vspeed;
    global.saveGrav = global.grav;
    
    global.saveJump = global.jump;
    global.saveDotkid = global.dotkid;
    
    if (!precise) {
        // floor player position to match standard engine behavior
        global.savePlayerX = round(global.savePlayerX);  // floor(421.00) = 420 omg
        global.savePlayerY = floor(global.savePlayerY);
        
        // if player is inside of a wall, it must be stuck up
        with (objPlayer) {
            if (!place_free(global.savePlayerX,global.savePlayerY)) global.savePlayerY += 1;
        }
    }
    
    for (var i = 0; i < global.secretItemTotal; i++) {
        global.saveSecretItem[i] = global.secretItem[i];
    }
    
    for (var i = 0; i < global.bossItemTotal; i++) {
        global.saveBossItem[i] = global.bossItem[i];
    }
    
    global.saveGameClear = global.gameClear;
}

global.saveSkin = global.skin;
global.saveSkinBlend = global.skinBlend;
global.saveBow = global.bow;


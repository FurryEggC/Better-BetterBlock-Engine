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
    
    for (var i = 0; i < global.secretItemTotal; i++)
    {
        global.saveSecretItem[i] = global.secretItem[i];
    }
    
    for (var i = 0; i < global.bossItemTotal; i++)
    {
        global.saveBossItem[i] = global.bossItem[i];
    }
    
    global.saveGameClear = global.gameClear;
}

global.saveSkin = global.skin;
global.saveSkinBlend = global.skinBlend;
global.saveBow = global.bow;

//create a map for save data
var saveMap = ds_map_create();

ds_map_add(saveMap,"death",global.death);
ds_map_add(saveMap,"time",global.time);
ds_map_add(saveMap,"timeMicro",global.timeMicro);

ds_map_add(saveMap,"difficulty",global.difficulty);
ds_map_add(saveMap,"saveRoom",global.saveRoom);
ds_map_add(saveMap,"savePlayerX",global.savePlayerX);
ds_map_add(saveMap,"savePlayerY",global.savePlayerY);
ds_map_add(saveMap,"saveGrav",global.saveGrav);

ds_map_add(saveMap,"saveJump",global.saveJump);
ds_map_add(saveMap,"saveDotkid",global.saveDotkid);

ds_map_add(saveMap,"saveSkin",global.saveSkin);
ds_map_add(saveMap,"saveSkinBlend",global.saveSkinBlend);
ds_map_add(saveMap,"saveBow",global.saveBow);

for (var i = 0; i < global.secretItemTotal; i++)
{
    ds_map_add(saveMap,"saveSecretItem["+string(i)+"]",global.saveSecretItem[i]);
}

for (var i = 0; i < global.bossItemTotal; i++)
{
    ds_map_add(saveMap,"saveBossItem["+string(i)+"]",global.saveBossItem[i]);
}

ds_map_add(saveMap,"saveGameClear",global.saveGameClear);

//add md5 hash to verify saves and make them harder to hack
ds_map_add(saveMap,"mapMd5",md5_string_unicode(json_encode(saveMap)+global.md5StrAdd));

// save ds_map to the global
ds_map_copy(global.toSaveMap, saveMap);

ds_map_destroy(saveMap);


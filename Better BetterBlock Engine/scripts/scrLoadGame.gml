/// scrLoadGame(loadFromFile)
/// loads the game
/// argument0 - whether to load from file (true) or just reset from current save point (false)

var loadFromFile = argument0;
var saveValid = true;
var saveMap = noone;

if (loadFromFile) {
    // read datas from file
    if (global.extraSaveProtection) {
        saveMap = ds_map_secure_load("Data\save" + string(global.savenum));
    } else {
        var f = file_text_open_read("Data\save" + string(global.savenum));
        if (f >= 0) {
            var str = file_text_read_string(f);
            file_text_close(f);
            saveMap = json_decode(base64_decode(str));
        } else {
            saveMap = -1;
        }
    }

    if (saveMap == -1) {
        saveValid = false;
    } else {
        // read datas from map
        global.death = saveMap[? "death"];
        global.time = saveMap[? "time"];
        global.timeMicro = saveMap[? "timeMicro"];
        
        global.difficulty = saveMap[? "difficulty"];
        global.saveRoom = saveMap[? "saveRoom"];
        global.savePlayerX = saveMap[? "savePlayerX"];
        global.savePlayerY = saveMap[? "savePlayerY"];
        global.saveGrav = saveMap[? "saveGrav"];
        
        global.saveJump = saveMap[? "saveJump"];
        global.saveDotkid = saveMap[? "saveDotkid"];
        
        global.saveSkin = saveMap[? "saveSkin"];
        global.saveSkinBlend = saveMap[? "saveSkinBlend"];
        global.saveBow = saveMap[? "saveBow"];
        
        if (is_string(global.saveRoom)) {
            if (!room_exists(asset_get_index(global.saveRoom))) {
                saveValid = false;
            }
        } else {
            saveValid = false;
        }

        for (var i = 0; i < global.secretItemTotal; i++) {
            global.saveSecretItem[i] = saveMap[? "saveSecretItem[" + string(i) + "]"];
        }
        for (var i = 0; i < global.bossItemTotal; i++) {
            global.saveBossItem[i] = saveMap[? "saveBossItem[" + string(i) + "]"];
        }
        
        global.saveGameClear = saveMap[? "saveGameClear"];
        
        // MD5 check
        var mapMd5 = saveMap[? "mapMd5"];
        if (!is_string(mapMd5)) mapMd5 = "";
        
        ds_map_delete(saveMap, "mapMd5");
        var genMd5 = md5_string_unicode(json_encode(saveMap) + global.md5StrAdd);

        if (mapMd5 != genMd5) {
            saveValid = false;
        }

        ds_map_destroy(saveMap);
    }
} else {
    // ok I think save is valid when not considering file, so I do nothing

    /*
    if (is_string(global.saveRoom)) {
        if (!room_exists(asset_get_index(global.saveRoom))) {
            saveValid = false;
        }
    } else {
        saveValid = false;
    }
    */
}

// Save invalid, restart
if (!saveValid) {
    show_message("Save invalid!");
    scrRestartGame();
    exit;
}


with (objPlayer) instance_destroy();

global.gameStarted = true;
global.noPause = false;
global.autosave = false;

global.grav = global.saveGrav;
global.jump = global.saveJump;
global.dotkid = global.saveDotkid;

global.skin = global.saveSkin;
global.skinBlend = global.saveSkinBlend;
global.bow = global.saveBow;

for (var i = 0; i < global.secretItemTotal; i++) {
    global.secretItem[i] = global.saveSecretItem[i];
}
for (var i = 0; i < global.bossItemTotal; i++) {
    global.bossItem[i] = global.saveBossItem[i];
}

global.gameClear = global.saveGameClear;

instance_create(global.savePlayerX, global.savePlayerY, objPlayer);
room_goto(asset_get_index(global.saveRoom));


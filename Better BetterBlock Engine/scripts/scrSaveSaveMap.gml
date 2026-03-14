/// scrSaveSaveMap()
// this function saves global.toSaveMap using IO system (file)
// Be aware when calling this function while IO is dangerous

// Save these information to the saveMap
global.toSaveMap[? "death"] = global.death;
global.toSaveMap[? "time"] = global.time;
global.toSaveMap[? "timeMicro"] = global.timeMicro;
global.toSaveMap[? "difficulty"] = global.difficulty;
global.toSaveMap[? "saveRoom"] = global.saveRoom;
global.toSaveMap[? "savePlayerX"] = global.savePlayerX;
global.toSaveMap[? "savePlayerY"] = global.savePlayerY;
global.toSaveMap[? "saveGrav"] = global.saveGrav;
global.toSaveMap[? "saveJump"] = global.saveJump;
global.toSaveMap[? "saveDotkid"] = global.saveDotkid;
global.toSaveMap[? "saveSkin"] = global.saveSkin;
global.toSaveMap[? "saveSkinBlend"] = global.saveSkinBlend;
global.toSaveMap[? "saveBow"] = global.saveBow;

for (var i = 0; i < global.secretItemTotal; i++) {
    global.toSaveMap[? "saveSecretItem["+string(i)+"]"] = global.saveSecretItem[i];
}

for (var i = 0; i < global.bossItemTotal; i++) {
    global.toSaveMap[? "saveBossItem["+string(i)+"]"] = global.saveBossItem[i];
}

global.toSaveMap[? "saveGameClear"] = global.saveGameClear;

//add md5 hash to verify saves and make them harder to hack
global.toSaveMap[? "mapMd5"] = md5_string_unicode(json_encode(global.toSaveMap)+global.md5StrAdd);

// show_message(json_encode(global.toSaveMap));

// save the map to a file
if (global.extraSaveProtection) {  // use ds_map_secure function
    ds_map_secure_save(global.toSaveMap,"Data\save"+string(global.savenum));
} else {   // use text file
    // open the save file
    var f = file_text_open_write("Data\save"+string(global.savenum));
    
    // write map to the save file with base64 encoding
    file_text_write_string(f,base64_encode(json_encode(global.toSaveMap)));
    
    file_text_close(f);
}


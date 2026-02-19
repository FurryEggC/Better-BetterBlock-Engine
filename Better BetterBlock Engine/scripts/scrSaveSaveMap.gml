/// scrSaveSaveMap()
// this function saves global.toSaveMap using IO system (file)
// Be aware when calling this function while IO is dangerous

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


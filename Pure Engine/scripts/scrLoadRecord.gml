///scrLoadRecord()
///loads the record, returns a map of previous records
///stageDeath[1], stageTime[1], totalDeath...

//load the save map
var saveMap;

if (global.extraSaveProtection) {
    // use ds_map_secure function
    saveMap = ds_map_secure_load("Data\record");
} else {
    // use text file
    if (!file_exists("Data\record")) return -1;
    
    var f = file_text_open_read("Data\record");
    
    saveMap = json_decode(base64_decode(file_text_read_string(f)));
    
    file_text_close(f);
}

// generate md5
var mapMd5 = saveMap[? "mapMd5"];

if (!is_string(mapMd5)) mapMd5 = "";

ds_map_delete(saveMap,"mapMd5");
var genMd5 = md5_string_unicode(json_encode(saveMap)+global.md5StrAdd);

if (mapMd5 != genMd5) return -1;

return saveMap;


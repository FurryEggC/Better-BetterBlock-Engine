///scrLoadRecord()
///loads the record, returns a map of previous records
///stageDeath[1], stageTime[1], totalDeath...

//load the save map
var saveMap;

if (global.extraSaveProtection) //use ds_map_secure function
{
    saveMap = ds_map_secure_load("Data\record");
}
else    //use text file
{
    var f = file_text_open_read("Data\record");
    
    saveMap = json_decode(base64_decode(file_text_read_string(f)));
    
    file_text_close(f);
}

return saveMap;


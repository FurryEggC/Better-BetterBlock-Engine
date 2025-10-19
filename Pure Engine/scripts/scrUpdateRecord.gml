///scrUpdateRecord()
///update the stage record, do it after ending animation finished

//create a map for save data
var saveMap = ds_map_create();
var previousRecord;

// load previousRecord
if (global.extraSaveProtection) //use ds_map_secure function
{
    previousRecord = ds_map_secure_load("Data\record");
}
else    //use text file
{
    var f = file_text_open_read("Data\record");
    if (f != -1) {
        previousRecord = json_decode(base64_decode(file_text_read_string(f)));
        file_text_close(f);
    }
    else previousRecord = -1;
}


var totalTime = 0, totalDeath = 0;
var previousTotalTime = 0, previousTotalDeath = 0;

if (previousRecord == -1) {  // update for the first time, save only
    for (var i = 0; i <= global.stageTotal; i++) {
        ds_map_add(saveMap,"stageDeath["+string(i)+"]",global.stageDeath[i]);
        ds_map_add(saveMap,"stageTime["+string(i)+"]",global.stageTime[i]);
        if (i == 0) continue;
        totalDeath += global.stageDeath[i];
        totalTime += global.stageTime[i];
    }
    ds_map_add(saveMap, "totalDeath", totalDeath);
    ds_map_add(saveMap, "totalTime", totalTime);
}
else {
    for (var i = 0; i <= global.stageTotal; i++) {
        var previousDeath = ds_map_find_value(previousRecord,"stageDeath["+string(i)+"]");
        var previousTime = ds_map_find_value(previousRecord,"stageTime["+string(i)+"]");
        ds_map_add(saveMap,"stageDeath["+string(i)+"]",min(global.stageDeath[i],previousDeath));
        ds_map_add(saveMap,"stageTime["+string(i)+"]",min(global.stageTime[i],previousTime));
        if (i == 0) continue;
        totalDeath += global.stageDeath[i];
        totalTime += global.stageTime[i];
    }
    var previousTotalDeath = ds_map_find_value(previousRecord,"totalDeath");
    var previousTotalTime = ds_map_find_value(previousRecord,"totalTime");
    ds_map_add(saveMap, "totalDeath", min(totalDeath,previousTotalDeath));
    ds_map_add(saveMap, "totalTime", min(totalTime,previousTotalTime));
}


//save the map to a file
if (global.extraSaveProtection) //use ds_map_secure function
{
    ds_map_secure_save(saveMap,"Data\record");
}
else    //use text file
{
    //open the save file
    var f = file_text_open_write("Data\record");
    
    //write map to the save file with base64 encoding
    file_text_write_string(f,base64_encode(json_encode(saveMap)));
    
    file_text_close(f);
}

//destroy the map
ds_map_destroy(saveMap);

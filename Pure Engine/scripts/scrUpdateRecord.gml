///scrUpdateRecord()
///update the stage record, do it after ending animation finished

var saveMap = ds_map_create();
var previousRecord;

previousRecord = scrLoadRecord();

// update for first time
if (previousRecord == -1) {
    var totalDeath = 0, totalTime = 0;
    for (var i = 0; i <= global.stageTotal; i++) {
        saveMap[? "stageDeath[" + string(i) + "]"] = global.stageDeath[i];
        saveMap[? "stageTime[" + string(i) + "]"] = global.stageTime[i];
        if (i == 0) continue;
        totalDeath += global.stageDeath[i];
        totalTime += global.stageTime[i];
    }
    saveMap[? "totalDeath"] = totalDeath;
    saveMap[? "totalTime"] = totalTime;
} else {  // update again

    var totalDeath = 0, totalTime = 0;
    var previousTotalDeath = previousRecord[? "totalDeath"];
    var previousTotalTime = previousRecord[? "totalTime"];
    
    for (var i = 0; i <= global.stageTotal; i++) {
        var prevDeath = previousRecord[? "stageDeath[" + string(i) + "]"];
        var prevTime = previousRecord[? "stageTime[" + string(i) + "]"];
        var curDeath = global.stageDeath[i];
        var curTime = global.stageTime[i];
        
        saveMap[? "stageDeath[" + string(i) + "]"] = min(curDeath, prevDeath);
        saveMap[? "stageTime[" + string(i) + "]"] = min(curTime, prevTime);
        
        if (i == 0) continue;
        totalDeath += curDeath;
        totalTime += curTime;
    }
    
    saveMap[? "totalDeath"] = min(totalDeath, previousTotalDeath);
    saveMap[? "totalTime"] = min(totalTime, previousTotalTime);
    
    ds_map_destroy(previousRecord);
}

// generate md5
saveMap[? "mapMd5"] = md5_string_unicode(json_encode(saveMap) + global.md5StrAdd);

// save map to file
if (global.extraSaveProtection) {
    ds_map_secure_save(saveMap, "Data\record");
} else {
    var f = file_text_open_write("Data\record");
    file_text_write_string(f, base64_encode(json_encode(saveMap)));
    file_text_close(f);
}

ds_map_destroy(saveMap);


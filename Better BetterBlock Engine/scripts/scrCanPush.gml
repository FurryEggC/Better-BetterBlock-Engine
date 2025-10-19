/// scrCanPush(x, y, dir)
// 检查在指定方向是否可以推动方块链

var checkX = argument0;
var checkY = argument1;
var dir = argument2;

// 如果位置是空的，可以推动
if (!place_meeting(checkX, checkY, objBetterBlock) && 
    !place_meeting(checkX, checkY, objPushBlock)) {
    return true;
}

// 如果位置有可推动的方块，递归检查
if (place_meeting(checkX, checkY, objPushBlock)) {
    with (instance_place(checkX, checkY, objPushBlock)) {
        return scrCanPush(x + dir, y, dir);
    }
}

// 其他情况不能推动
return false;

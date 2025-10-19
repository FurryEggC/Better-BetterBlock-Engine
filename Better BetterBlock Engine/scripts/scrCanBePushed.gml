/// scrCanBePushed(direction)
// 检查这个方块是否可以被推动

var dir = argument0;

// 检查推动方向是否有障碍物
if (place_meeting(x + dir * pushSpeed, y, objBetterBlock)) {
    return false;
}

// 检查推动方向上是否有其他方块
var blockAhead = instance_place(x + dir * pushSpeed, y, objPushBlock);
if (blockAhead && blockAhead != id) {
    // 递归检查前方的方块是否可以被推动
    if (!scrCanBePushed(blockAhead.dir)) {
        return false;
    }
}

// 如果不是悬空推动且不在另一个方块上，则不能推动
if (!airPush && !place_meeting(x, y+1*sign(grav), objBetterBlock)) {
    return false;
}

// 所有检查通过，可以推动
return true;

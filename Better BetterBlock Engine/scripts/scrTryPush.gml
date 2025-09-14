/// scrTryPush(direction, pusher)
// 尝试推动这个方块，返回是否成功

var dir = argument0;
var pusherId = argument1;

// 如果已经被推动，检查是否是同一个推动者
if (beingPushed && pushDirection == dir) {
    return true;
}

// 检查前方是否有障碍物
if (place_meeting(x + dir, y, objBetterBlock)) {
    return false;
}

// 检查前方是否有其他方块
var blockAhead = instance_place(x + dir, y, objPushBlock);
if (blockAhead && blockAhead != pusherId) {
    // 尝试推动前方的方块
    if (!scrTryPush(blockAhead.dir, blockAhead.id)) {
        return false;
    }
}

// 如果可以移动，设置推动状态
beingPushed = true;
pushDirection = dir;
h = dir * pushSpeed;

// 移动这个方块
x += dir;

return true;

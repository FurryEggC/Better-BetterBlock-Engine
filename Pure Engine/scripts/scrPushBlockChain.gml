/// scrPushBlockChain(x, y, dir)
// 推动相连的方块链

var checkX = argument0;
var checkY = argument1;
var dir = argument2;

// 如果位置有可推动的方块，递归推动
if (place_meeting(checkX, checkY, objPushBlock)) {
    with (instance_place(checkX, checkY, objPushBlock)) {
        scrPushBlockChain(x + dir, y, dir);
        x += dir;
    }
}


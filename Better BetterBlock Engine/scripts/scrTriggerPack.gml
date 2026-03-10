#define scrTriggerPack
/*
    OK This is a script pack, i don't know how to unpack it well just that it's good
    
    This pack contains some useful trigger functions
    You just need to write them in creation code of new Triggers
    And they would work as you thought
*/

#define scrPath
/// scrPath(id, pth, spd, enda, scl)

scrInitMove(argument0, 0, argument1, argument2, argument3, argument4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);



#define scrMove
/// scrMove(id, infinite, dir, spd, v, h, len)

var pattern = 2;
if (argument1) pattern = 1;
scrInitMove(argument0, pattern, 0, argument3, 0, 1, argument2, argument6, argument4, argument5, 0, 0, 0, 0, 0, 0);



#define scrMoveExp
/// scrMoveExp(id, destX, destY, expt)

scrInitMove(argument0, 3, 0, 0, 0, 0, 0, 0, 0, 0, argument1, argument2, argument3, 0, 0, 0);




#define scrMoveBazier
/// scrMoveBazier(id, time, dir, len, pr1, pr2)

scrInitMove(argument0, 4, 0, 0, 0, 0, argument2, argument3, 0, 0, 0, 0, 0, argument4, argument5, argument1);





#define scrMoveBazierXY
/// scrMoveBazierXY(id, time, destX, destY, pr1, pr2)

scrInitMove(argument0, 4, 0, 0, 0, 0, 0, 0, 0, 0, argument2, argument3, 0, argument4, argument5, argument1);




#define scrInitMove
/// scrInitMove(id, pattern, pth, spd, enda, scl, dir, len, v, h, destX, destY, expt, pr1, pr2, time)

var moveObj = instance_create(x, y, objMoveThis);

with (moveObj) {
    target = argument0;
    pattern = argument1;
    pth = argument2;
    spd = argument3;
    enda = argument4;
    scl = argument5;
    dir = argument6;
    len = argument7;
    v = argument8;
    h = argument9;
    destX = argument10;
    destY = argument11;
    expt = argument12;
    pr1 = argument13;
    pr2 = argument14;
    time = argument15;
}

triggerArray[len] = moveObj;
len += 1;


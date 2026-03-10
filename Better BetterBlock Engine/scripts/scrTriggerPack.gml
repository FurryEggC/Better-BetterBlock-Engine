#define scrTriggerPack
/*
        OK This is a script pack, i don't know how to unpack it well just
    that it's good
    
        This pack contains some useful trigger functions, you just need to
    write them in creation code of new Triggers, And they would work as you
    thought.
    
        As you see these moves are one dimentional (except path), and these
    are scripts that recommend to call:
    
        scrPath();
        scrMove();
        scrMoveDir();
        scrMoveLen();
        scrMoveLenDir();
        scrMoveLenXY();
        scrMoveExp();
        scrMoveBazier();
        scrMoveBazierXY();
        
        You know what they mean after you see the foot script there.
*/

#define scrPath
/// scrPath(id, pth, spd, enda, scl)

scrInitMove(argument0, 0, argument1, argument2, argument3, argument4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);



#define scrMove
/// scrMove(id, v, h)

scrInitMove(argument0, 1, 0, 0, 0, 1, 0, 0, argument1, argument2, 0, 0, 0, 0, 0, 0);



#define scrMoveDir
/// scrMoveDir(id, dir, spd)

scrInitMove(argument0, 1, 0, argument2, 0, 1, argument1, 0, 0, 0, 0, 0, 0, 0, 0, 0);



#define scrMoveLen
/// scrMoveLen(id, v, h, len)

scrInitMove(argument0, 2, 0, 0, 0, 1, 0, argument3, argument1, argument2, 0, 0, 0, 0, 0, 0);



#define scrMoveLenDir
/// scrMoveLenDir(id, dir, spd, len)

scrInitMove(argument0, 2, 0, argument2, 0, 1, argument1, argument3, 0, 0, 0, 0, 0, 0, 0, 0);



#define scrMoveLenXY
/// scrMoveLenXY(id, destX, destY, time)

scrInitMove(argument0, 2, 0, 0, 0, 1, 0, 0, 0, 0, argument1, argument2, 0, 0, 0, argument3);



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
//scrMutiPushBlockMove()
// Move horizontally, pixel by pixel, until hit a wall or fall off a ledge.

if (object_index != objMutiPushBlock && !object_is_ancestor(object_index, objMutiPushBlock)) {
    show_error("Can't call this function by this object!", 1);
}

var dist = abs(h);
var dir = sign(h);
while(dist--) {
    if (!airPush && !place_meeting(x, y+1*sign(grav), objBetterBlockBase)) return false;

    if (place_meeting(x + dir, y, objBetterBlock)) return false;
    while(place_meeting(x + dir, y, objMutiPushBlock))
    {
        with(instance_place(x + dir, y, objMutiPushBlock))
        {
            h = dir;
            if(!scrMutiPushBlockMove()) return false;
        }
    }
    x += dir;
}

return true;


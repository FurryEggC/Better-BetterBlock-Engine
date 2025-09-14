///scrIsBetterBlock(id)
var t_id = noone;

if (argument_count == 0)
    t_id = id;
else{
    t_id = argument[0];
    if (!instance_exists(t_id))
        return false;
}

if (t_id.object_index == objBetterBlockBase || object_is_ancestor(t_id.object_index, objBetterBlockBase))
    return true;
else
    return false;

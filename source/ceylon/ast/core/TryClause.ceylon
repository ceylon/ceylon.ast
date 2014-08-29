"A ‘`try`’ clause, that is,
 the keyword ‘`try`’, followed optionally by [[resources]] and then by a [[block]] (required).
 
 Examples (multi-line):
 
     try {
         value zombie = spawn { Zombie; center = player.location; spread = 50; };
         zombie.aggro = player;
     }
 
     try (writer = file.Writer()) {
         that.serialize(writer);
     }"
shared class TryClause(block, resources = null)
        extends Node() {
    
    "The block."
    shared Block block;
    "The resources, if present."
    shared Resources? resources;
    
    //shared actual [Resources, Block]|[Block] children;
    // TODO use the above more accurate type when backend bug is fixed
    shared actual Node[] children;
    if (exists resources) {
        children = [resources, block];
    } else {
        children = [block];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTryClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is TryClause that) {
            if (exists resources) {
                if (exists resources_ = that.resources) {
                    return resources == resources_ && block == that.block;
                } else {
                    return false;
                }
            } else {
                if (!(that.resources exists)) {
                    return block == that.block;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (block.hash + 31 * (resources?.hash else 0));
    
    shared TryClause copy(Block block = this.block, Resources? resources = this.resources) {
        value ret = TryClause(block, resources);
        copyExtraInfoTo(ret);
        return ret;
    }
}

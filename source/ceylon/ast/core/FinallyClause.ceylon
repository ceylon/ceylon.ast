"""A ‘`finally`’ clause, that is, the keyword ‘`finally`’ followed by a [[block]].
   
   Examples:
   
       finally { print("END"); }
       finally { workers.collect(Worker.kill); }"""
shared class FinallyClause(block)
        extends Node() {
    
    "The block of the ‘`finally`’ clause."
    shared Block block;
    
    shared actual [Block] children = [block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFinallyClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is FinallyClause that) {
            return block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * block.hash;
    
    shared FinallyClause copy(Block block = this.block) {
        value ret = FinallyClause(block);
        copyExtraInfoTo(ret);
        return ret;
    }
}

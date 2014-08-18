"""An ‘`else`’ failure clause for a [[‘`for`’ loop|ForStatement]], that is,
   the keyword ‘`else`’ followed by a [[block]].
   
   Examples:
   
       else { print("Hello, World!"); }"""
shared class FailClause(block)
        extends Node() {
    
    "The block of the ‘`else`’ failure clause."
    shared Block block;
    
    shared actual [Block] children = [block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFailClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is FailClause that) {
            return block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * block.hash;
    
    shared FailClause copy(Block block = this.block) {
        value ret = FailClause(block);
        copyExtraInfoTo(ret);
        return ret;
    }
}

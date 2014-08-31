"""An ‘`else`’ clause of a [[‘`switch`’ statement|SwitchCaseElse]].
   
   (This is not quite the same thing as an [[ElseClause]], since in an `ElseCaseClause`
   ‘`else if`’ is not allowed.)
   
   Examples (multi-line):
   
       else {
           throw AssertionError("Unknown type!");
       }
   
       else {
           items.add(null);
       }"""
shared class ElseCaseClause(block)
        extends Node() {
    
    "The block that is executed
     when no [[`case` clause|CaseClause]] matches."
    shared Block block;
    
    shared actual [Block] children = [block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformElseCaseClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is ElseCaseClause that) {
            return block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * block.hash;
    
    shared ElseCaseClause copy(Block block = this.block) {
        value ret = ElseCaseClause(block);
        copyExtraInfoTo(ret);
        return ret;
    }
}

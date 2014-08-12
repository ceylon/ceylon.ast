"""An `else` clause, that is, the keyword ‘`else`’, followed by a block or another if/else conditional.
   
   Examples (multi-line):
   
       else {
           return "<null>";
       }
   
       else if (exists div) {
           visit(div.paragraphs);
       }"""
shared class ElseClause(child)
        extends Node() {
    
    "The block or if/else conditional that is entered
     if the conditions of the parent if/else’s `if`
     weren’t satisfied."
    shared Block|IfElse child; // TODO is there a better name for this than “child”?
    
    shared actual [Block|IfElse] children = [child];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformElseClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is ElseClause that) {
            return child == that.child;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * child.hash;
    
    shared ElseClause copy(Block|IfElse child = this.child) {
        value ret = ElseClause(child);
        copyExtraInfoTo(ret);
        return ret;
    }
}

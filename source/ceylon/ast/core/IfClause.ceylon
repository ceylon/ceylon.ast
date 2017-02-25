"An `if` clause, that is, the keyword ‘`if`’, followed by a [[condition list|conditions]] and a [[block]].
 
 Examples:
 
     if (15 <= estimatedAge <= 25) { askForID(); }
     if (exists elseClause = that.elseClause) { elseClause.visit(this); }"
shared class IfClause(conditions, block)
        extends Node() {
    
    "The conditions that need to be satisfied to enter the [[block]]."
    shared Conditions conditions;
    "The block that is entered if the [[conditions]] are satisfied."
    shared Block block;
    
    shared actual [Conditions, Block] children = [conditions, block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIfClause(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIfClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is IfClause that) {
            return conditions==that.conditions && block==that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (conditions.hash + 31*block.hash);
    
    shared IfClause copy(Conditions conditions = this.conditions, Block block = this.block) {
        value ret = IfClause(conditions, block);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A ‘`for`’ clause, that is, the keyword ‘`for`’ followed by an [[iterator]] and a [[block]].
   
   (Not to be confused with a complete [[‘`for`’ loop|ForFail]], which also includes an optional [[failure clause|FailClause]].)
   
   Examples:
   
       for (person in people) { print(person.name); }
       for (name->person in peopleByName) { print("``name``: ``person.age``"); }"""
shared class ForClause(iterator, block)
        extends Node() {
    
    "The iterator of the ‘`for`’ clause."
    shared ForIterator iterator;
    "The block of the ‘`for`’ clause.
     
     Within this block, the variable of the [[iterator]] carries
     the current iteration result."
    shared Block block;
    
    shared actual [ForIterator, Block] children = [iterator, block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformForClause(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitForClause(this);

    shared actual Boolean equals(Object that) {
        if (is ForClause that) {
            return iterator == that.iterator && block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (iterator.hash + 31 * block.hash);
    
    shared ForClause copy(ForIterator iterator = this.iterator, Block block = this.block) {
        value ret = ForClause(iterator, block);
        copyExtraInfoTo(ret);
        return ret;
    }
}

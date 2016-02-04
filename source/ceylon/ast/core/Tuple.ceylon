"A tuple instantiation expression.
 
 Examples:
 
     []     
     [x, y]
     [father, mother, *children]"
shared class Tuple(argumentList)
        extends Atom() {
    
    "The tuple arguments."
    shared ArgumentList argumentList;
    
    shared actual [ArgumentList] children = [argumentList];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTuple(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTuple(this);

    shared actual Boolean equals(Object that) {
        if (is Tuple that) {
            return argumentList == that.argumentList;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * argumentList.hash;
    
    shared Tuple copy(ArgumentList argumentList = this.argumentList) {
        value ret = Tuple(argumentList);
        copyExtraInfoTo(ret);
        return ret;
    }
}

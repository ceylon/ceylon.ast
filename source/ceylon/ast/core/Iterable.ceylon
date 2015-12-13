"An iterable object instantiation expression.
 
 Examples:
 
     {}
     { second, first, *rest.rest }"
shared class Iterable(argumentList)
        extends Atom() {
    
    "The iterable arguments."
    shared ArgumentList argumentList;
    
    shared actual [ArgumentList] children = [argumentList];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIterable(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIterable(this);

    shared actual Boolean equals(Object that) {
        if (is Iterable that) {
            return argumentList == that.argumentList;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * argumentList.hash;
    
    shared Iterable copy(ArgumentList argumentList = this.argumentList) {
        value ret = Iterable(argumentList);
        copyExtraInfoTo(ret);
        return ret;
    }
}

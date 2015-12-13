"A positional argument list.
 
 A list of arguments where the mapping from an argument to its parameter
 is based only on the position of the argument. Syntactically, this is
 just a wrapper for an [[ArgumentList]], enclosed in parentheses.
 
 Examples:
 
     (x, y, *messages)
     ()
     (for (i in 1..10) i^2)"
shared class PositionalArguments(argumentList = ArgumentList())
        extends Arguments() {
    
    "The enclosed argument list."
    shared ArgumentList argumentList;
    
    shared actual [ArgumentList] children = [argumentList];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPositionalArguments(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPositionalArguments(this);

    shared actual Boolean equals(Object that) {
        if (is PositionalArguments that) {
            return argumentList == that.argumentList;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * argumentList.hash;
    
    shared PositionalArguments copy(ArgumentList argumentList = this.argumentList) {
        value ret = PositionalArguments(argumentList);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"A tuple instantiation expression.
 
 Examples:
 
     []     
     [x, y]
     [father, mother, *children]"
shared class Tuple(arguments)
        extends Atom() {
    
    "The tuple arguments."
    shared ArgumentList arguments;
    
    shared actual [ArgumentList] children = [arguments];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTuple(this);
    
    shared actual Boolean equals(Object that) {
        if (is Tuple that) {
            return arguments == that.arguments;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * arguments.hash;
    
    shared Tuple copy(ArgumentList arguments = this.arguments) {
        value ret = Tuple(arguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}

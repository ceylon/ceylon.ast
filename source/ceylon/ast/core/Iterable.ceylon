"An iterable object instantiation expression.
 
 Examples:
 
     {}
     { second, first, *rest.rest }"
shared class Iterable(arguments)
        extends Atom() {
    
    "The iterable arguments."
    shared ArgumentList arguments;
    
    shared actual [ArgumentList] children = [arguments];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIterable(this);
    
    shared actual Boolean equals(Object that) {
        if (is Iterable that) {
            return arguments == that.arguments;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * arguments.hash;
    
    shared Iterable copy(ArgumentList arguments = this.arguments) {
        value ret = Iterable(arguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}

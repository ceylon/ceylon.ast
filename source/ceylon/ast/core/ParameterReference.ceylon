"The name of a parameter, without type information.
 
 There are two possible interpretations of such a parameter:
 
 1. The parameter is later declared in the body of the function or class.
    This is frequently used for class parameters,
    where having the documentation in the parameter list
    would clutter the parameter list.
 2. The type of the parameter is inferred.
    This is only legal for anonymous functions,
    and intended for small one-line arguments to functions
    like [[ceylon.language::Iterable.map]] or [[ceylon.language::Iterable.filter]]
    (with a [[LazySpecifier]] rather than a [[Block]]).
 
 Examples:
 
     comparing
     name"
see (`class DefaultedParameterReference`)
shared class ParameterReference(name)
        extends RequiredParameter() {
    
    "The name of the parameter."
    shared MemberName name;
    
    shared actual [MemberName] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformParameterReference(this);
    
    shared actual Boolean equals(Object that) {
        if (is ParameterReference that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared ParameterReference copy(MemberName name = this.name) {
        value ret = ParameterReference(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}

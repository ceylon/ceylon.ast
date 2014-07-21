"The name of a parameter declared in the body of the function or class.
 
 This is frequently used for class parameters,
 where having the documentation in the parameter list
 would clutter the parameter list.
 
 Examples:
 
     comparing
     name"
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

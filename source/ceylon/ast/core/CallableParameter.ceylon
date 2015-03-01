"A callable parameter.
 
 Examples:
 
     Comparison comparing(Element left, Element right)
     void onSuccess()"
see (`class DefaultedCallableParameter`)
shared class CallableParameter(type, name, parameterLists, annotations = Annotations())
        extends RequiredParameter() {
    
    "The annotations of the parameter."
    shared Annotations annotations;
    "The type of the parameter, or a ‘`void`’ modifier."
    shared Type|VoidModifier type;
    "The name of the parameter."
    shared MemberName name;
    "The parameter list(s) of the parameter."
    shared [Parameters+] parameterLists; // parameterses? ;-)
    
    shared actual [Annotations, Type|VoidModifier, LIdentifier, Parameters+] children = [annotations, type, name, *parameterLists];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCallableParameter(this);
    
    shared actual Boolean equals(Object that) {
        if (is CallableParameter that) {
            return annotations == that.annotations && type == that.type && name == that.name && parameterLists == that.parameterLists;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (annotations.hash + 31 * (type.hash + 31 * (name.hash + 31 * parameterLists.hash)));
    
    shared CallableParameter copy(Type|VoidModifier type = this.type, MemberName name = this.name, [Parameters+] parameterLists = this.parameterLists, Annotations annotations = this.annotations) {
        value ret = CallableParameter(type, name, parameterLists, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

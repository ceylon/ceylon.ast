"A callable parameter.
 
 Examples:
 
     Comparison comparing(Element left, Element right)
     void onSuccess()"
see (`class DefaultedCallableParameter`)
shared class CallableParameter(type, name, parameterLists, annotations = Annotations())
        extends RequiredParameter() {
    
    "The annotations of the parameter."
    shared Annotations annotations;
    "The type of the parameter.
     
     This can be:
     - a [[Type]],
     - a [[‘`void`’ modifier|VoidModifier]] for a function that does not return a value,
     - a [[‘`function`’ modifier|FunctionModifier]] for a function with inferred return type
       (which is illegal for callable parameters, but not a syntactic restriction), or
     - a [[‘`dynamic`’ modifier|DynamicModifier]] for a dynamically typed function."
    shared Type|VoidModifier|FunctionModifier|DynamicModifier type;
    "The name of the parameter."
    shared MemberName name;
    "The parameter list(s) of the parameter."
    shared [Parameters+] parameterLists; // parameterses? ;-)
    
    shared actual [Annotations, Type|VoidModifier|FunctionModifier|DynamicModifier, LIdentifier, Parameters+] children = [annotations, type, name, *parameterLists];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCallableParameter(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCallableParameter(this);

    shared actual Boolean equals(Object that) {
        if (is CallableParameter that) {
            return annotations == that.annotations && type == that.type && name == that.name && parameterLists == that.parameterLists;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (annotations.hash + 31 * (type.hash + 31 * (name.hash + 31 * parameterLists.hash)));
    
    shared CallableParameter copy(Type|VoidModifier|FunctionModifier|DynamicModifier type = this.type, MemberName name = this.name, [Parameters+] parameterLists = this.parameterLists, Annotations annotations = this.annotations) {
        value ret = CallableParameter(type, name, parameterLists, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

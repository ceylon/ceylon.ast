"A function declaration.
 
 A function declaration declares the [[name]], [[type]], [[parameters|parameterLists]],  
 [[type parameters|typeParameters]] and [[type constraints|typeConstraints]] of the value,
 but doesn’t provide a [[definition]] for it. There are several possible reasons for this:
 
 - The function can be a [[formal]] method of an [[abstract]] class or an interface,
   and subtypes have to provide the definition.
 - The function can be the declaration of a class or function [[parameter|ParameterReference]]
   that only listed the name.
 - The function can be forward-declared, and the definition will be provided later.
 
 In any case, the declaration must explicitly specify a type;
 a [[‘`function`’ modifier|FunctionModifier]] indicating type inference cannot be used.
 (The ’`dynamic`’ modifier counts as a “type” here, indicating
 not the inference, but rather the *absense* of typing information.)"
shared class FunctionDeclaration(name, type, parameterLists, typeParameters = null, typeConstraints = [], annotations = Annotations())
        extends AnyFunction() {
    
    shared actual MemberName name;
    "The type of the declared function.
     
     This can be:
     - a [[Type]],
     - a [[‘`void`’ modifier|VoidModifier]] for a function that does not return a value,
     - a [[‘`function`’ modifier|FunctionModifier]] for a function with inferred return type
       (which is illegal for declarations without definition, but not a syntactic restriction), or
     - a [[‘`dynamic`’ modifier|DynamicModifier]] for a dynamically typed function."
    shared actual Type|VoidModifier|FunctionModifier|DynamicModifier type;
    shared actual [Parameters+] parameterLists;
    shared actual TypeParameters? typeParameters;
    shared actual TypeConstraint[] typeConstraints;
    shared actual Annotations annotations;
    "A function declaration has no definition."
    shared actual Null definition = null;
    
    shared actual [Annotations, Type|VoidModifier|FunctionModifier|DynamicModifier, LIdentifier, TypeParameters|Parameters|TypeConstraint*] children
            = [annotations, type, name, *concatenate(emptyOrSingleton(typeParameters), parameterLists, typeConstraints)];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionDeclaration(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitFunctionDeclaration(this);

    shared actual Boolean equals(Object that) {
        if (is FunctionDeclaration that) {
            if (exists typeParameters) {
                if (exists typeParameters_ = that.typeParameters) {
                    if (typeParameters != typeParameters_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.typeParameters exists) {
                return false;
            }
            return typeConstraints == that.typeConstraints && name == that.name && type == that.type && parameterLists == that.parameterLists;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * (parameterLists.hash + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash)))));
    
    shared FunctionDeclaration copy(MemberName name = this.name, Type|VoidModifier|FunctionModifier|DynamicModifier type = this.type, [Parameters+] parameterLists = this.parameterLists, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = FunctionDeclaration(name, type, parameterLists, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

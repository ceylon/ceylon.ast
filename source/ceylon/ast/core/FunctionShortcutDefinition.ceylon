"""A function shortcut definition, using a lazy specifier
   and terminated by a semicolon.
   
   Examples:
   
       shared void run() => print("Hello, `` process.arguments.first else "World" ``!");
       shared actual Boolean equals(Object that) => that is This;"""
shared class FunctionShortcutDefinition(name, type, parameterLists, definition, typeParameters = null, typeConstraints = [], annotations = Annotations())
        extends AnyFunction() {
    
    shared actual LIdentifier name;
    "The type of the function.
     
     This can be:
     - a [[Type]],
     - a [[‘`void`’ modifier|VoidModifier]] for a function that does not return a value,
     - a [[‘`function`’ modifier|FunctionModifier]] for a function with inferred type,
     - a [[‘`dynamic’` modifier|DynamicModifier]] for a dynamically typed function."
    shared actual Type|VoidModifier|FunctionModifier|DynamicModifier type;
    shared actual [Parameters+] parameterLists;
    shared actual LazySpecifier definition;
    shared actual TypeParameters? typeParameters;
    shared actual TypeConstraint[] typeConstraints;
    shared actual Annotations annotations;
    
    shared actual [Annotations, Type|FunctionModifier|DynamicModifier|VoidModifier, LIdentifier, TypeParameters|TypeConstraint|LazySpecifier*] children
            = [annotations, type, name, *concatenate(emptyOrSingleton(typeParameters), typeConstraints, [definition])];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionShortcutDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is FunctionShortcutDefinition that) {
            if (exists typeParameters) {
                if (exists typeParameters_ = that.typeParameters) {
                    return typeParameters == typeParameters_ && name == that.name && type == that.type && parameterLists == that.parameterLists && definition == that.definition && typeConstraints == that.typeConstraints && annotations == that.annotations;
                } else {
                    return false;
                }
            } else {
                if (!(that.typeParameters exists)) {
                    return name == that.name && type == that.type && parameterLists == that.parameterLists && definition == that.definition && typeConstraints == that.typeConstraints && annotations == that.annotations;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * (parameterLists.hash + 31 * (definition.hash + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))))));
    
    shared FunctionShortcutDefinition copy(LIdentifier name = this.name, Type|VoidModifier|FunctionModifier|DynamicModifier type = this.type, [Parameters+] parameterLists = this.parameterLists, LazySpecifier definition = this.definition, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = FunctionShortcutDefinition(name, type, parameterLists, definition, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

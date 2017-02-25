"A value declaration.
 
 A value declaration declares the [[name]] and [[type]] of the value,
 but doesn’t provide a [[definition]] for it. There are several possible reasons for this:
 
 - The value can be a [[formal]] attribute and be a member of an [[abstract]] class             
   or an interface, and subtypes have to provide the definition.
 - The value can be the declaration of a class or function [[parameter|ParameterReference]]
   that only listed the name (and potentially a default value).       
 - The value can be forward-declared, and the definition will be provided later.
 
 In any case, the declaration must explicitly specify a type;
 a [[Modifier]] indicating type inference cannot be used.
 (The ’`dynamic`’ modifier counts as a “type” here, indicating
 not the inference, but rather the *absense* of typing information.)"
shared class ValueDeclaration(name, type, annotations = Annotations())
        extends AnyValue() {
    
    "The name of the declared value."
    shared actual MemberName name;
    "The type of the declared value.
     
     This can be:
     - a proper [[Type]],
     - a [[variadic type|VariadicType]] for the declaration of a variadic [[parameter|ParameterReference]], or
     - a [[’`dynamic`’ modifier|DynamicModifier]] to indicate the absence of a type."
    shared actual Type|VariadicType|DynamicModifier type;
    "The annotations of the declared value."
    shared actual Annotations annotations;
    "A value declaration has no definition."
    shared actual Null definition = null;
    
    shared actual [Annotations, Type|VariadicType|DynamicModifier, LIdentifier] children = [annotations, type, name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueDeclaration(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueDeclaration(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueDeclaration that) {
            return name==that.name && type==that.type && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31*annotations.hash));
    
    shared ValueDeclaration copy(MemberName name = this.name, Type|VariadicType|DynamicModifier type = this.type, Annotations annotations = this.annotations) {
        value ret = ValueDeclaration(name, type, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

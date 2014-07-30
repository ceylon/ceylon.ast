"An attribute declaration.
 
 An attribute declaration declares the [[name]] and [[type]] of the attribute,
 but doesn’t provide a [[definition]] for it. There are several possible reasons for this:
 
 - The attribute can be declared [[formal]] and be a member of an [[abstract]] class             
   or an interface, and subtypes have to provide the definition.
 - The attribute can be the declaration of a class or function [[parameter|ParameterReference]]
   that only listed the name (and potentially a default value).       
 - The attribute can be forward-declared, and the definition will be provided later.
 
 In any case, the declaration must explicitly specify a type;
 a [[Modifier]] indicating type inference cannot be used.
 (The ’`dynamic`’ modifier counts as a “type” here, indicating
 not the inference, but rather the *absense* of typing information.)"
shared class AttributeDeclaration(name, type, annotations = Annotations())
        extends AnyAttribute() {
    
    "The name of the declared attribute."
    shared actual MemberName name;
    "The type of the declared attribute."
    shared actual Type|DynamicModifier type;
    "The annotations of the declared attribute."
    shared actual Annotations annotations;
    "An attribute declaration has no definition."
    shared actual Null definition = null;
    
    shared actual [Annotations, Type|DynamicModifier, LIdentifier] children = [annotations, type, name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAttributeDeclaration(this);
    
    shared actual Boolean equals(Object that) {
        if (is AttributeDeclaration that) {
            return name == that.name && type == that.type && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * annotations.hash));
    
    shared AttributeDeclaration copy(MemberName name = this.name, Type|DynamicModifier type = this.type, Annotations annotations = this.annotations) {
        value ret = AttributeDeclaration(name, type, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

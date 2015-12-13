"""A value definition, using a specifier.
   
   Examples:
   
       shared actual String string => "``name`` from ``countryOfOrigin`` of age ``age``";
       shared actual Null definition = null;"""
shared class ValueDefinition(name, type, definition, annotations = Annotations())
        extends AnyValue() {
    
    shared actual MemberName name;
    "The type of the value.
     
     This can be:
     - a proper [[Type]],
     - a [[’`value`’ modifier|ValueModifier]] to indicate type inference, or
     - a [[’`dynamic`’ modifier|DynamicModifier]] to indicate the absence of a type."
    shared actual Type|ValueModifier|DynamicModifier type;
    "The definition of the value."
    shared actual AnySpecifier definition;
    shared actual Annotations annotations;
    
    shared actual [Annotations, Type|ValueModifier|DynamicModifier, LIdentifier, AnySpecifier] children = [annotations, type, name, definition];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueDefinition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueDefinition(this);

    shared actual Boolean equals(Object that) {
        if (is ValueDefinition that) {
            return name == that.name && type == that.type && definition == that.definition && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * (definition.hash + 31 * annotations.hash)));
    
    shared ValueDefinition copy(MemberName name = this.name, Type|ValueModifier|DynamicModifier type = this.type, AnySpecifier definition = this.definition, Annotations annotations = this.annotations) {
        value ret = ValueDefinition(name, type, definition, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A value definition, using a getter block.
   
   Examples:
   
       shared actual String string { value s = element.string; return ", ".join(Singleton(element).cycled.take(size)); }"""
shared class ValueGetterDefinition(name, type, definition, annotations)
        extends AnyValue() {
    
    shared actual MemberName name;
    "The type of the value.
     
     This can be:
     - a proper [[Type]],
     - a [[’`value`’ modifier|ValueModifier]] to indicate type inference, or
     - a [[’`dynamic`’ modifier|DynamicModifier]] to indicate the absence of a type."
    shared actual Type|ValueModifier|DynamicModifier type;
    "The definition of the value."
    shared actual Block definition;
    shared actual Annotations annotations;
    
    shared actual [Annotations, Type|ValueModifier|DynamicModifier, LIdentifier, Block] children = [annotations, type, name, definition];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueGetterDefinition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueGetterDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueGetterDefinition that) {
            return name==that.name && type==that.type && definition==that.definition && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * (definition.hash + 31*annotations.hash)));
    
    shared ValueGetterDefinition copy(MemberName name = this.name, Type|ValueModifier|DynamicModifier type = this.type, Block definition = this.definition, Annotations annotations = this.annotations) {
        value ret = ValueGetterDefinition(name, type, definition, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A setter definition, that is,
   the keyword ‘`assign`’, followed by the [[name]] of the value and the [[definition]]
   (either a block or a lazy specifier terminated by a semicolon), preceded by [[annotations]].
   
   Examples:
   
       assign diameter => radius = diameter / 2;
       assign diameter {
           throw AssertionError("Can’t set the diameter of the unit circle");
       }"""
shared class ValueSetterDefinition(name, definition, annotations = Annotations())
        extends Declaration() {
    
    "The name of the value that this setter assigns to."
    shared actual LIdentifier name;
    "The definition of the setter."
    shared Block|LazySpecifier definition;
    "The annotations of the setter."
    shared actual Annotations annotations;
    
    shared actual [Annotations, LIdentifier, Block|LazySpecifier] children = [annotations, name, definition];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueSetterDefinition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueSetterDefinition(this);

    shared actual Boolean equals(Object that) {
        if (is ValueSetterDefinition that) {
            return name == that.name && definition == that.definition && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (definition.hash + 31 * annotations.hash));
    
    shared ValueSetterDefinition copy(LIdentifier name = this.name, Block|LazySpecifier definition = this.definition, Annotations annotations = this.annotations) {
        value ret = ValueSetterDefinition(name, definition, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}

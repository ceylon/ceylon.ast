"A ‘`value`’ modifier keyword.
 
 The ‘`value`’ modifier keyword indicates that the type of a value
 is inferred."
shared class ValueModifier()
        extends LocalModifier() {
    
    shared actual String text = "value";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueModifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueModifier(this);

    shared actual Boolean equals(Object that) {
        return that is ValueModifier;
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared ValueModifier copy() {
        value ret = ValueModifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}

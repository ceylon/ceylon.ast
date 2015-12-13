"A ‘`void`’ modifier keyword."
shared class VoidModifier()
        extends TypeModifier() {
    
    shared actual String text = "void";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformVoidModifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitVoidModifier(this);

    shared actual Boolean equals(Object that) {
        return that is VoidModifier;
    }
    
    shared actual Integer hash
            => text.hash;
    
    shared VoidModifier copy() {
        value ret = VoidModifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}

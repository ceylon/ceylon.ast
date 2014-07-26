"A ‘`void`’ modifier keyword."
shared class VoidModifier()
        extends Modifier() {
    
    shared actual String text = "void";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformVoidModifier(this);
    
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

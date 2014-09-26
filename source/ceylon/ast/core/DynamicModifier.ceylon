"A ‘`dynamic`’ modifier keyword."
shared class DynamicModifier()
        extends TypeModifier() {
    
    shared actual String text = "dynamic";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDynamicModifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is DynamicModifier that) {
            return text == that.text;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared DynamicModifier copy() {
        value ret = DynamicModifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}

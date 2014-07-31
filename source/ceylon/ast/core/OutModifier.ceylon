"An ’`out`’ modifier, indicating a covariant type parameter or argument."
shared class OutModifier()
        extends Variance() {
    
    shared actual String text = "out";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOutModifier(this);
    
    shared actual Boolean equals(Object that) {
        return that is OutModifier;
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared OutModifier copy() {
        value ret = OutModifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}

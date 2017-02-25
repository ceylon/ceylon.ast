"An ‘`in`’ modifier, indicating a contravariant type parameter or argument."
shared class InModifier()
        extends Variance() {
    
    shared actual String text = "in";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInModifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitInModifier(this);
    
    shared actual Boolean equals(Object that) {
        return that is InModifier;
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared InModifier copy() {
        value ret = InModifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}

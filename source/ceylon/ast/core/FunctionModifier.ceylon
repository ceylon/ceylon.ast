"A ‘`function`’ modifier keyword.
 
 The ‘`function`’ modifier keyword indicates that the type of a function
 is inferred."
shared class FunctionModifier()
        extends LocalModifier() {
    
    shared actual String text = "function";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionModifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitFunctionModifier(this);

    shared actual Boolean equals(Object that) {
        return that is FunctionModifier;
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared FunctionModifier copy() {
        value ret = FunctionModifier();
        copyExtraInfoTo(ret);
        return ret;
    }
}

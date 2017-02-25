"A `break` directive."
shared class Break()
        extends Directive() {
    
    "A `break` directive has no result."
    shared actual Null result = null;
    
    text = "break";
    
    shared actual [] children = [];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBreak(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitBreak(this);
    
    shared actual Boolean equals(Object that) {
        return that is Break;
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared Break copy() {
        value ret = Break();
        copyExtraInfoTo(ret);
        return ret;
    }
}

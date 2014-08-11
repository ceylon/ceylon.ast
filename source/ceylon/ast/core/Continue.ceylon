"A `continue` directive."
shared class Continue()
        extends Directive() {
    
    "A `continue` directive has no result."
    shared actual Null result = null;
    
    text = "continue";
    
    shared actual [] children = [];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformContinue(this);
    
    shared actual Boolean equals(Object that) {
        return that is Continue;
    }
    
    shared actual Integer hash
            => 31 * text.hash;
    
    shared Continue copy() {
        value ret = Continue();
        copyExtraInfoTo(ret);
        return ret;
    }
}

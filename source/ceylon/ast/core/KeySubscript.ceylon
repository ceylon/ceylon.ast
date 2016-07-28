"A key / index subscript expression,
 to select an element from a [[Correspondence]] expression.
 
 The [[key]] may be any expression except for a [[SpanOperation]] or [[MeasureOperation]],
 which would be ambiguous with a [[SpanSubscript]] or [[MeasureSubscript]].
 
 Examples:
 
     key
     offset + i"
see (`interface Correspondence`, `function Correspondence.get`)
shared class KeySubscript(key)
        extends Subscript() {
    
    "The key / index expression itself.
     
     See [[Correspondence.get.key]]."
    shared Expression key;
    
    "Key may not be a span or measure operation
     due to ambiguity with span or measure subscripts
     (wrap in grouped expression to resolve ambiguity)."
    assert (!key is SpanOperation|MeasureOperation);
    
    shared actual [Expression] children = [key];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformKeySubscript(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitKeySubscript(this);

    shared actual Boolean equals(Object that) {
        if (is KeySubscript that) {
            return key == that.key;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * key.hash;
    
    shared KeySubscript copy(Expression key = this.key) {
        value ret = KeySubscript(key);
        copyExtraInfoTo(ret);
        return ret;
    }
}

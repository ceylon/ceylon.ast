"A span-from subscript,
 to select a (sub)range from a [[Ranged]] expression
 using the [[first index|from]].
 
 Examples:
 
     1...
     match.start ..."
see (`function Ranged.spanFrom`)
shared class SpanFromSubscript(from)
        extends RangeSubscript() {
    
    "The expression for the first selected index.
     
     See [[Ranged.spanFrom.from]]."
    shared AddingExpression from;
    
    shared actual [AddingExpression] children = [from];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpanFromSubscript(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpanFromSubscript(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpanFromSubscript that) {
            return from == that.from;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * from.hash;
    
    shared SpanFromSubscript copy(AddingExpression from = this.from) {
        value ret = SpanFromSubscript(from);
        copyExtraInfoTo(ret);
        return ret;
    }
}

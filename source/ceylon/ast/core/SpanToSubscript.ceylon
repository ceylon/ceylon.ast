"A span-to subscript,
 to select a (sub)range from a [[Ranged]] expression
 using the [[last index|to]].
 
 Examples:
     ... text.size - 1
     ...count"
see (`function Ranged.spanTo`)
shared class SpanToSubscript(to)
        extends RangeSubscript() {
    
    "The expression for the last selected index.
     
     See [[Ranged.spanTo.to]]."
    shared AddingExpression to;
    
    shared actual [AddingExpression] children = [to];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpanToSubscript(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpanToSubscript(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpanToSubscript that) {
            return to == that.to;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * to.hash;
    
    shared SpanToSubscript copy(AddingExpression to = this.to) {
        value ret = SpanToSubscript(to);
        copyExtraInfoTo(ret);
        return ret;
    }
}

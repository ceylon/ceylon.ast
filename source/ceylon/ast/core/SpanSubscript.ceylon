"A span subscript,
 to select a (sub)range from a [[Ranged]] expression
 using the [[first|from]] and [[last|to]] index.
 
 Examples:
 
     1 .. text.size - 2
     text.size - 1 .. 0"
see (`function Ranged.span`, `class SpanOperation`)
shared class SpanSubscript(from, to)
        extends RangeSubscript() {
    
    "The expression for the first selected index.
     
     See [[Ranged.span.from]]."
    shared AddingExpression from;
    "The expression for the last selected index.
     
     See [[Ranged.span.to]]."
    shared AddingExpression to;
    
    shared actual [AddingExpression, AddingExpression] children = [from, to];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpanSubscript(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpanSubscript(this);

    shared actual Boolean equals(Object that) {
        if (is SpanSubscript that) {
            return from == that.from && to == that.to;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (from.hash + 31 * to.hash);
    
    shared SpanSubscript copy(AddingExpression from = this.from, AddingExpression to = this.to) {
        value ret = SpanSubscript(from, to);
        copyExtraInfoTo(ret);
        return ret;
    }
}

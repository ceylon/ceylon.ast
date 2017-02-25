"A measure subscript,
 to select a (sub)range from a [[Ranged]] expression
 using the [[first index|from]] and [[length]].
 
 Examples:
 
     0:30
     match.start:match.size"
see (`function Ranged.measure`, `class MeasureOperation`)
shared class MeasureSubscript(from, length)
        extends RangeSubscript() {
    
    "The expression for the first selected index.
     
     See [[Ranged.measure.from]]."
    shared AddingExpression from;
    "The expression for the length.
     
     See [[Ranged.measure.length]]."
    shared AddingExpression length;
    
    shared actual [AddingExpression, AddingExpression] children = [from, length];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMeasureSubscript(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitMeasureSubscript(this);
    
    shared actual Boolean equals(Object that) {
        if (is MeasureSubscript that) {
            return from==that.from && length==that.length;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (from.hash + 31*length.hash);
    
    shared MeasureSubscript copy(AddingExpression from = this.from, AddingExpression length = this.length) {
        value ret = MeasureSubscript(from, length);
        copyExtraInfoTo(ret);
        return ret;
    }
}

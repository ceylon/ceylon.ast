"A range subscript,
 to select a (sub)range from a [[Ranged]] expression.
 
 Examples:
 
     1 .. text.size - 2
     1..."
see (`interface Ranged`)
shared abstract class RangeSubscript()
        of SpanSubscript | MeasureSubscript | SpanFromSubscript | SpanToSubscript
        extends Subscript() {
}

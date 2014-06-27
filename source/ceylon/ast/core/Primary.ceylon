"A primary expression.
 
 Primaries can be combined using [[operations|OperatorExpression]]."
shared abstract class Primary(Expression[] children)
        of Atom
        extends ValueExpression(children) {
}

"A primary expression.
 
 Primaries can be combined using [[operations|OperatorExpression]]."
shared abstract class Primary(ExpressionIsh[] children)
        of Atom | BaseExpression | QualifiedExpression
        extends ValueExpression(children) {
}

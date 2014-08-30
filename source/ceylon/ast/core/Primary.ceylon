"A primary expression.
 
 Primaries can be combined using [[operations|Operation]]."
shared abstract class Primary()
        of Atom | BaseExpression | QualifiedExpression | Invocation | ElementOrSubrangeExpression | Meta | Dec
        extends ValueExpression() {
}

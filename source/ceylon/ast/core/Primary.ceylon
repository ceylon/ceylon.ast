"A primary expression.
 
 Primaries can be combined using [[operations|Operation]]."
shared abstract class Primary()
        of Atom | BaseExpression | QualifiedExpression | Meta | Dec
        extends ValueExpression() {
}

"All node types in the expression sub-hierarchy:
 [[Expression]] and some auxiliary node types that aren’t proper Expressions."
shared abstract class ExpressionIsh()
        of Expression | TypeIsh | Identifier | ArgumentList | SpreadArgument | Arguments
        extends Node() {
    shared actual formal <ExpressionIsh|Identifier|Type>[] children;
}

"Abstract superclass of all expression nodes."
// TODO document the expression hierarchy as soon as some members of that hierarchy are actually implemented
shared abstract class Expression()
        of ValueExpression // TODO other case types
        extends ExpressionIsh() {
    shared actual formal ExpressionIsh[] children;
}

"All node types in the expression sub-hierarchy:
 [[Expression]] and some auxiliary node types that aren’t proper Expressions."
shared abstract class ExpressionIsh()
        of Expression | TypeIsh | Identifier | FullPackageName | ArgumentList | SpreadArgument | Arguments | NamedArgument | AnySpecifier | Parameters | Bound | Modifier | Body | Comprehension | Subscript | DecQualifier | AnyMemberOperator
        extends Node() {
    shared actual formal <ExpressionIsh|Identifier|Parameter|Declaration|Statement|ComprehensionClause|ExtendedType|SatisfiedTypes>[] children;
}

"Abstract superclass of all expression nodes."
// TODO document the expression hierarchy as soon as some members of that hierarchy are actually implemented
shared abstract class Expression()
        of ValueExpression | FunctionExpression // TODO operator-style expressions
        extends ExpressionIsh() {
    shared actual formal ExpressionIsh[] children;
}

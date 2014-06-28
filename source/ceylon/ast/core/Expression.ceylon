"All node types in the expression sub-hierarchy:
 [[Expression]] and some auxiliary node types that aren’t proper Expressions."
shared abstract class ExpressionIsh(<ExpressionIsh|Identifier|Type>[] kids)
        of Expression | NameWithTypeArguments
        extends Node(kids) {
    shared actual <ExpressionIsh|Identifier|Type>[] children = kids;
}

"Abstract superclass of all expression nodes."
// TODO document the expression hierarchy as soon as some members of that hierarchy are actually implemented
shared abstract class Expression(ExpressionIsh[] kids)
        of ValueExpression // TODO other case types
        extends ExpressionIsh(kids) {
}

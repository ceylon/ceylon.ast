"All node types in the expression sub-hierarchy:
 [[Expression]] and some auxiliary node types that aren’t proper Expressions."
shared abstract class ExpressionIsh()
        of Expression | TypeIsh | Identifier | FullPackageName | ArgumentList | SpreadArgument | Arguments | NamedArgument | AnySpecifier | Parameters | Bound | Modifier | Body | Comprehension | Subscript | DecQualifier | AnyMemberOperator
        extends Node() {
    shared actual formal <ExpressionIsh|Identifier|Parameter|Declaration|Statement|ComprehensionClause|ExtendedType|SatisfiedTypes>[] children;
}

"""Abstract superclass of all expression nodes.
   
   Correct operator precedence and associativity is enforced by the parameter types
   of the various child classes. For example, consider the following simple expression:
   
       1 + 2 * 3
   
   Because multiplication has higher precedence than addition, the correct syntax tree
   for this expression is:
   ~~~
   SumOperation {
       leftOperand = IntegerLiteral("1");
       rightOperand = ProductOperation {
           leftOperand = IntegerLiteral("2");
           rightOperand = IntegerLiteral("3");
       };
   }
   ~~~
   A very simple, strictly left-associative parser that doesn’t respect operator
   precedence might instead try to produce:
   ~~~
   ProductOperation {
       leftFactor = SumOperation {
           leftSummand = IntegerLiteral("1");
           rightSummand = IntegerLiteral("2");
       };
       rightFactor = IntegerLiteral("3");
   }
   ~~~
   However, this is not well-typed (the parser would likely have an assertion failure
   at runtime), because the types of [[ProductOperation]]’s child nodes are crafted such
   that only nodes with correct precedence and associativity can be created.
   
   To ensure this, there is one type alias for each precedence level, specified as
   the union type of
   - the next higher level’s alias, and
   - all operator types on this level.
   
   For example, there is [[MultiplyingExpression]] for multiplicative expressions
   and [[AddingExpression]] for summative expressions.
   [[ProductOperation.leftFactor]] then has type [[MultiplyingExpression]],
   which does not include [[SumOperation]].
   [[ProductOperation.rightFactor]] has the next higher level’s type [[UnioningExpression]],
   reflecting the left-associativity of product operations:
   Instead of
   ~~~
   ProductOperation {
       leftFactor = IntegerLiteral("1");
       rightFactor = ProductOperation {
           leftFactor = IntegerLiteral("2");
           rightFactor = IntegerLiteral("3");
       };
   }
   ~~~
   you should have
   ~~~
   ProductOperation {
       leftFactor = ProductOperation {
           leftFactor = IntegerLiteral("1");
           rightFactor = IntegerLiteral("2");
       };
       rightFactor = IntegerLiteral("3");
   }
   ~~~
   
   These aliases are, from highest to lowest precedence:
   - [[PrePostfixingExpression]]
   - [[ExponentiatingExpression]]
   - [[InvertingExpression]]
   - [[IntersectingExpression]]
   - [[UnioningExpression]]
   - [[MultiplyingExpression]]
   - [[ScalingExpression]]
   - [[AddingExpression]]
   - [[SpanningExpression]]
   - [[ExistsNonemptyExpression]]
   - [[ComparingExpression]]
   - [[EquatingExpression]]
   - [[NegatingExpression]]
   - [[ConjoiningExpression]]
   - [[DisjoiningExpression]]
   - [[ThenElseExpression]]
   - [[AssigningExpression]]"""
shared abstract class Expression()
        of ValueExpression | FunctionExpression
        extends ExpressionIsh() {
    shared actual formal ExpressionIsh[] children;
}

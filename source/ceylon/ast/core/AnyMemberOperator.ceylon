"A member operator, used in a [[QualifiedExpression]]."
shared abstract class AnyMemberOperator()
        of MemberOperator | SafeMemberOperator | SpreadMemberOperator
        extends ExpressionIsh() {
    "The text of the operator itself."
    shared formal String text;
}

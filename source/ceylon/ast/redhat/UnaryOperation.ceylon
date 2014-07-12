import ceylon.ast.core {
    UnaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNegativeOp=NegativeOp,
        JPositiveOp=PositiveOp,
        JPostfixOperatorExpression=PostfixOperatorExpression,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

"Converts a RedHat AST [[UnaryOperatorExpression|JUnaryOperatorExpression]] to a `ceylon.ast` [[UnaryOperation]]."
shared UnaryOperation unaryOperationToCeylon(JUnaryOperatorExpression unaryOperatorExpression) {
    assert (is JPostfixOperatorExpression|JPrefixOperatorExpression|JNegativeOp|JPositiveOp unaryOperatorExpression); // TODO more case types!
    switch (unaryOperatorExpression)
    case (is JPostfixOperatorExpression) { return postfixOperationToCeylon(unaryOperatorExpression); }
    case (is JPrefixOperatorExpression) { return prefixOperationToCeylon(unaryOperatorExpression); }
    case (is JNegativeOp) { return negationOperationToCeylon(unaryOperatorExpression); }
    case (is JPositiveOp) { return identityOperationToCeylon(unaryOperatorExpression); }
}

"Compiles the given [[code]] for a Unary Operation
 into a [[UnaryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared UnaryOperation? compileUnaryOperation(String code) {
    if (is JUnaryOperatorExpression jUnaryExpression = createParser(code).assignmentExpression()) {
        return unaryOperationToCeylon(jUnaryExpression);
    } else {
        return null;
    }
}

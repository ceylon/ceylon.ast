import ceylon.ast.core {
    PostfixOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp,
        JPostfixIncrementOp=PostfixIncrementOp,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[PostfixOperatorExpression|JPostfixOperatorExpression]] to a `ceylon.ast` [[PostfixOperation]]."
shared PostfixOperation postfixOperationToCeylon(JPostfixOperatorExpression postfixOperatorExpression) {
    assert (is JPostfixDecrementOp|JPostfixIncrementOp postfixOperatorExpression);
    switch (postfixOperatorExpression)
    case (is JPostfixDecrementOp) { return postfixDecrementOperationToCeylon(postfixOperatorExpression); }
    case (is JPostfixIncrementOp) { return postfixIncrementOperationToCeylon(postfixOperatorExpression); }
}

"Compiles the given [[code]] for a Postfix Operation
 into a [[PostfixOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixOperation? compilePostfixOperation(String code) {
    if (is JPostfixOperatorExpression jPostfixExpression = createParser(code).postfixIncrementDecrementExpression(),
        !jPostfixExpression.term is JPostfixOperatorExpression) { // grammar allows chaining postfix operators
        return postfixOperationToCeylon(jPostfixExpression);
    } else {
        return null;
    }
}

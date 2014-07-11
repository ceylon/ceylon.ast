import ceylon.ast.core {
    PostfixDecrementOperation,
    Primary
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[PostfixDecrementOp|JPostfixDecrementOp]] to a `ceylon.ast` [[PostfixDecrementOperation]]."
shared PostfixDecrementOperation postfixDecrementOperationToCeylon(JPostfixDecrementOp postfixDecrementOperation) {
    assert (is Primary primary = expressionToCeylon(postfixDecrementOperation.term));
    return PostfixDecrementOperation(primary);
}

"Compiles the given [[code]] for a Postfix Decrement Operation
 into a [[PostfixDecrementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixDecrementOperation? compilePostfixDecrementOperation(String code) {
    if (is JPostfixDecrementOp jPostfixDecrementOp = createParser(code).postfixIncrementDecrementExpression(),
        !jPostfixDecrementOp.term is JPostfixOperatorExpression) { // grammar allows chaining postfix operators
        return postfixDecrementOperationToCeylon(jPostfixDecrementOp);
    } else {
        return null;
    }
}

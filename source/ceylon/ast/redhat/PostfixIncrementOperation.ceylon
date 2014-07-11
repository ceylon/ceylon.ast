import ceylon.ast.core {
    PostfixIncrementOperation,
    Primary
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixIncrementOp=PostfixIncrementOp,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[PostfixIncrementOp|JPostfixIncrementOp]] to a `ceylon.ast` [[PostfixIncrementOperation]]."
shared PostfixIncrementOperation postfixIncrementOperationToCeylon(JPostfixIncrementOp postfixIncrementOperation) {
    assert (is Primary primary = expressionToCeylon(postfixIncrementOperation.term));
    return PostfixIncrementOperation(primary);
}

"Compiles the given [[code]] for a Postfix Increment Operation
 into a [[PostfixIncrementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixIncrementOperation? compilePostfixIncrementOperation(String code) {
    if (is JPostfixIncrementOp jPostfixIncrementOp = createParser(code).postfixIncrementDecrementExpression(),
        !jPostfixIncrementOp.term is JPostfixOperatorExpression) { // grammar allows chaining postfix operators
        return postfixIncrementOperationToCeylon(jPostfixIncrementOp);
    } else {
        return null;
    }
}

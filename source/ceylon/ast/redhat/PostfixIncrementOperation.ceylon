import ceylon.ast.core {
    PostfixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixIncrementOp=PostfixIncrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[PostfixIncrementOp|JPostfixIncrementOp]] to a `ceylon.ast` [[PostfixIncrementOperation]]."
shared PostfixIncrementOperation postfixIncrementOperationToCeylon(JPostfixIncrementOp postfixIncrementOperation) {
    assert (is JPrimary jPrimary = postfixIncrementOperation.term);
    return PostfixIncrementOperation(primaryToCeylon(jPrimary));
}

"Compiles the given [[code]] for a Postfix Increment Operation
 into a [[PostfixIncrementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixIncrementOperation? compilePostfixIncrementOperation(String code) {
    if (is JPostfixIncrementOp jPostfixIncrementOp = createParser(code).postfixIncrementDecrementExpression(),
        jPostfixIncrementOp.term is JPrimary) {
        return postfixIncrementOperationToCeylon(jPostfixIncrementOp);
    } else {
        return null;
    }
}

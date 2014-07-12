import ceylon.ast.core {
    PostfixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[PostfixDecrementOp|JPostfixDecrementOp]] to a `ceylon.ast` [[PostfixDecrementOperation]]."
shared PostfixDecrementOperation postfixDecrementOperationToCeylon(JPostfixDecrementOp postfixDecrementOperation) {
    assert (is JPrimary jPrimary = postfixDecrementOperation.term);
    return PostfixDecrementOperation(primaryToCeylon(jPrimary));
}

"Compiles the given [[code]] for a Postfix Decrement Operation
 into a [[PostfixDecrementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixDecrementOperation? compilePostfixDecrementOperation(String code) {
    if (is JPostfixDecrementOp jPostfixDecrementOp = createParser(code).postfixIncrementDecrementExpression(),
        jPostfixDecrementOp.term is JPrimary) {
        return postfixDecrementOperationToCeylon(jPostfixDecrementOp);
    } else {
        return null;
    }
}

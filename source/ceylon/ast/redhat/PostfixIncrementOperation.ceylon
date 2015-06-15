import ceylon.ast.core {
    Node,
    PostfixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPostfixIncrementOp=PostfixIncrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[PostfixIncrementOp|JPostfixIncrementOp]] to a `ceylon.ast` [[PostfixIncrementOperation]]."
shared PostfixIncrementOperation postfixIncrementOperationToCeylon(JPostfixIncrementOp postfixIncrementOperation, Anything(JNode,Node) update = noop) {
    assert (is JPrimary jPrimary = postfixIncrementOperation.term);
    value result = PostfixIncrementOperation(primaryToCeylon(jPrimary, update));
    update(postfixIncrementOperation, result);
    return result;
}

"Compiles the given [[code]] for a Postfix Increment Operation
 into a [[PostfixIncrementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixIncrementOperation? compilePostfixIncrementOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JPostfixIncrementOp jPostfixIncrementOp = createParser(code).postfixIncrementDecrementExpression(),
        jPostfixIncrementOp.term is JPrimary) {
        return postfixIncrementOperationToCeylon(jPostfixIncrementOp, update);
    } else {
        return null;
    }
}

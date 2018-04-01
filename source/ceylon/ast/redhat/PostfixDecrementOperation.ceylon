import ceylon.ast.core {
    Node,
    PostfixDecrementOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[PostfixDecrementOp|JPostfixDecrementOp]] to a `ceylon.ast` [[PostfixDecrementOperation]]."
shared PostfixDecrementOperation postfixDecrementOperationToCeylon(JPostfixDecrementOp postfixDecrementOperation, Anything(JNode, Node) update = noop) {
    assert (is JPrimary jPrimary = postfixDecrementOperation.term);
    value result = PostfixDecrementOperation(primaryToCeylon(jPrimary, update));
    update(postfixDecrementOperation, result);
    return result;
}

"Parses the given [[code]] for a Postfix Decrement Operation
 into a [[PostfixDecrementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixDecrementOperation? parsePostfixDecrementOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JPostfixDecrementOp jPostfixDecrementOp = createParser(code).postfixIncrementDecrementExpression(),
        jPostfixDecrementOp.term is JPrimary) {
        return postfixDecrementOperationToCeylon(jPostfixDecrementOp, update);
    } else {
        return null;
    }
}

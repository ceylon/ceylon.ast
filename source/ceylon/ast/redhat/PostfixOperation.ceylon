import ceylon.ast.core {
    Node,
    PostfixOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp,
        JPostfixIncrementOp=PostfixIncrementOp,
        JPostfixOperatorExpression=PostfixOperatorExpression,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[PostfixOperatorExpression|JPostfixOperatorExpression]] to a `ceylon.ast` [[PostfixOperation]]."
shared PostfixOperation postfixOperationToCeylon(JPostfixOperatorExpression postfixOperatorExpression, Anything(JNode,Node) update = noop) {
    assert (is JPostfixDecrementOp|JPostfixIncrementOp postfixOperatorExpression);
    switch (postfixOperatorExpression)
    case (is JPostfixDecrementOp) { return postfixDecrementOperationToCeylon(postfixOperatorExpression, update); }
    case (is JPostfixIncrementOp) { return postfixIncrementOperationToCeylon(postfixOperatorExpression, update); }
}

"Parses the given [[code]] for a Postfix Operation
 into a [[PostfixOperation]] using the Ceylon compiler
 (more specifically, the rule for a `postfixIncrementDecrementExpression`)."
shared PostfixOperation? parsePostfixOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JPostfixOperatorExpression jPostfixExpression = createParser(code).postfixIncrementDecrementExpression(),
        jPostfixExpression.term is JPrimary) {
        return postfixOperationToCeylon(jPostfixExpression, update);
    } else {
        return null;
    }
}

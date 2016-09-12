import ceylon.ast.core {
    NegatingExpression,
    Node,
    NotOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNotOp=NotOp
    }
}

"Converts a RedHat AST [[NotOp|JNotOp]] to a `ceylon.ast` [[NotOperation]]."
shared NotOperation notOperationToCeylon(JNotOp notOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is NegatingExpression operand = expressionToCeylon(notOperation.term, update));
    value result = NotOperation(operand);
    update(notOperation, result);
    return result;
}

"Parses the given [[code]] for a Not Operation
 into a [[NotOperation]] using the Ceylon compiler
 (more specifically, the rule for a `logicalNegationExpression`)."
shared NotOperation? parseNotOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JNotOp jLogicalNegationExpression = createParser(code).logicalNegationExpression()) {
        return notOperationToCeylon(jLogicalNegationExpression, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ComparingExpression,
    Node,
    NotEqualOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNotEqualOp=NotEqualOp
    }
}

"Converts a RedHat AST [[NotEqualOp|JNotEqualOp]] to a `ceylon.ast` [[NotEqualOperation]]."
shared NotEqualOperation notEqualOperationToCeylon(JNotEqualOp notEqualOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ComparingExpression left = expressionToCeylon(notEqualOperation.leftTerm, update),
        is ComparingExpression right = expressionToCeylon(notEqualOperation.rightTerm, update));
    value result = NotEqualOperation(left, right);
    update(notEqualOperation, result);
    return result;
}

"Parses the given [[code]] for a Not Equal Operation
 into a [[NotEqualOperation]] using the Ceylon compiler
 (more specifically, the rule for a `equalityExpression`)."
shared NotEqualOperation? parseNotEqualOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JNotEqualOp jEqualityExpression = createParser(code).equalityExpression()) {
        return notEqualOperationToCeylon(jEqualityExpression, update);
    } else {
        return null;
    }
}

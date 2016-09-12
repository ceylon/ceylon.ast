import ceylon.ast.core {
    ElseOperation,
    DisjoiningExpression,
    Node,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDefaultOp=DefaultOp
    }
}

"Converts a RedHat AST [[DefaultOp|JDefaultOp]] to a `ceylon.ast` [[ElseOperation]]."
shared ElseOperation elseOperationToCeylon(JDefaultOp elseOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(elseOperation.leftTerm, update),
        is DisjoiningExpression right = expressionToCeylon(elseOperation.rightTerm, update));
    value result = ElseOperation(left, right);
    update(elseOperation, result);
    return result;
}

"Parses the given [[code]] for an Else Operation
 into an [[ElseOperation]] using the Ceylon compiler
 (more specifically, the rule for a `thenElseExpression`)."
shared ElseOperation? parseElseOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JDefaultOp jThenElseExpression = createParser(code).thenElseExpression()) {
        return elseOperationToCeylon(jThenElseExpression, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ExistsNonemptyExpression,
    Node,
    WithinOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JWithinOp=WithinOp
    }
}

"Converts a RedHat AST [[WithinOp|JWithinOp]] to a `ceylon.ast` [[WithinOperation]]."
shared WithinOperation withinOperationToCeylon(JWithinOp withinOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression operand = expressionToCeylon(withinOperation.term, update));
    value result = WithinOperation(operand, boundToCeylon(withinOperation.lowerBound, update), boundToCeylon(withinOperation.upperBound, update));
    update(withinOperation, result);
    return result;
}

"Parses the given [[code]] for a Within Operation
 into a [[WithinOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared WithinOperation? parseWithinOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JWithinOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return withinOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}

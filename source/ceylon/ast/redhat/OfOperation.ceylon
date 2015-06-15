import ceylon.ast.core {
    ExistsNonemptyExpression,
    Node,
    OfOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JOfOp=OfOp,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[OfOp|JOfOp]] to a `ceylon.ast` [[OfOperation]]."
shared OfOperation ofOperationToCeylon(JOfOp ofOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression operand = expressionToCeylon(ofOperation.term, update));
    "Must be a real type"
    assert (is JStaticType type = ofOperation.type);
    value result = OfOperation(operand, typeToCeylon(type, update));
    update(ofOperation, result);
    return result;
}

"Compiles the given [[code]] for an Of Operation
 into an [[OfOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared OfOperation? compileOfOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JOfOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return ofOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}

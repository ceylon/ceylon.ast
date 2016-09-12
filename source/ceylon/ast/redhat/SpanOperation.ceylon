import ceylon.ast.core {
    AddingExpression,
    Node,
    SpanOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JRangeOp=RangeOp
    }
}

"Converts a RedHat AST [[RangeOp|JRangeOp]] to a `ceylon.ast` [[SpanOperation]]."
shared SpanOperation spanOperationToCeylon(JRangeOp spanOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(spanOperation.leftTerm, update),
        is AddingExpression right = expressionToCeylon(spanOperation.rightTerm, update));
    value result = SpanOperation(left, right);
    update(spanOperation, result);
    return result;
}

"Parses the given [[code]] for a Span Operation
 into a [[SpanOperation]] using the Ceylon compiler
 (more specifically, the rule for an `entryRangeExpression`)."
shared SpanOperation? parseSpanOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JRangeOp jEntryRangeExpression = createParser(code).entryRangeExpression()) {
        return spanOperationToCeylon(jEntryRangeExpression, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    MeasureOperation,
    AddingExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSegmentOp=SegmentOp
    }
}

"Converts a RedHat AST [[SegmentOp|JSegmentOp]] to a `ceylon.ast` [[MeasureOperation]]."
shared MeasureOperation measureOperationToCeylon(JSegmentOp measureOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(measureOperation.leftTerm, update),
        is AddingExpression right = expressionToCeylon(measureOperation.rightTerm, update));
    value result = MeasureOperation(left, right);
    update(measureOperation, result);
    return result;
}

"Compiles the given [[code]] for a Measure Operation
 into a [[MeasureOperation]] using the Ceylon compiler
 (more specifically, the rule for an `entryRangeExpression`)."
shared MeasureOperation? compileMeasureOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JSegmentOp jEntryRangeExpression = createParser(code).entryRangeExpression()) {
        return measureOperationToCeylon(jEntryRangeExpression, update);
    } else {
        return null;
    }
}

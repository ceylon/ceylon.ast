import ceylon.ast.core {
    MeasureOperation,
    Precedence8Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSegmentOp=SegmentOp
    }
}

"Converts a RedHat AST [[SegmentOp|JSegmentOp]] to a `ceylon.ast` [[MeasureOperation]]."
shared MeasureOperation measureOperationToCeylon(JSegmentOp measureOperation) {
    "Check precedence"
    assert (is Precedence8Expression left = expressionToCeylon(measureOperation.leftTerm),
        is Precedence8Expression right = expressionToCeylon(measureOperation.rightTerm));
    return MeasureOperation(left, right);
}

"Compiles the given [[code]] for a Measure Operation
 into a [[MeasureOperation]] using the Ceylon compiler
 (more specifically, the rule for an `entryRangeExpression`)."
shared MeasureOperation? compileMeasureOperation(String code) {
    if (is JSegmentOp jEntryRangeExpression = createParser(code).entryRangeExpression()) {
        return measureOperationToCeylon(jEntryRangeExpression);
    } else {
        return null;
    }
}

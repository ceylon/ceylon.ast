import ceylon.ast.core {
    BinaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticOp=ArithmeticOp,
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JBitwiseOp=BitwiseOp,
        JComparisonOp=ComparisonOp,
        JEntryOp=EntryOp,
        JInOp=InOp,
        JRangeOp=RangeOp,
        JScaleOp=ScaleOp,
        JSegmentOp=SegmentOp
    }
}

"Converts a RedHat AST [[BinaryOperatorExpression|JBinaryOperatorExpression]] to a `ceylon.ast` [[BinaryOperation]]."
shared BinaryOperation binaryOperationToCeylon(JBinaryOperatorExpression binaryOperation) {
    assert (is JArithmeticOp|JBitwiseOp|JScaleOp|JRangeOp|JSegmentOp|JEntryOp|JInOp|JComparisonOp binaryOperation);
    switch (binaryOperation)
    case (is JArithmeticOp) { return arithmeticOperationToCeylon(binaryOperation); }
    case (is JBitwiseOp) { return setOperationToCeylon(binaryOperation); }
    case (is JScaleOp) { return scaleOperationToCeylon(binaryOperation); }
    case (is JRangeOp) { return spanOperationToCeylon(binaryOperation); }
    case (is JSegmentOp) { return measureOperationToCeylon(binaryOperation); }
    case (is JEntryOp) { return entryOperationToCeylon(binaryOperation); }
    case (is JInOp) { return inOperationToCeylon(binaryOperation); }
    case (is JComparisonOp) { return comparisonOperationToCeylon(binaryOperation); }
}

"Compiles the given [[code]] for a Binary Operation
 into a [[BinaryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared BinaryOperation? compileBinaryOperation(String code) {
    if (is JBinaryOperatorExpression jBinaryOperation = createParser(code).assignmentExpression()) {
        return binaryOperationToCeylon(jBinaryOperation);
    } else {
        return null;
    }
}

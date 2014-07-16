import ceylon.ast.core {
    BinaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticOp=ArithmeticOp,
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JBitwiseOp=BitwiseOp,
        JCompareOp=CompareOp,
        JComparisonOp=ComparisonOp,
        JDefaultOp=DefaultOp,
        JEntryOp=EntryOp,
        JEqualityOp=EqualityOp,
        JIdenticalOp=IdenticalOp,
        JInOp=InOp,
        JLogicalOp=LogicalOp,
        JRangeOp=RangeOp,
        JScaleOp=ScaleOp,
        JSegmentOp=SegmentOp,
        JThenOp=ThenOp
    }
}

"Converts a RedHat AST [[BinaryOperatorExpression|JBinaryOperatorExpression]] to a `ceylon.ast` [[BinaryOperation]]."
shared BinaryOperation binaryOperationToCeylon(JBinaryOperatorExpression binaryOperation) {
    assert (is JArithmeticOp|JBitwiseOp|JScaleOp|JRangeOp|JSegmentOp|JEntryOp|JInOp|JComparisonOp|JCompareOp|JEqualityOp|JIdenticalOp|JLogicalOp|JThenOp|JDefaultOp binaryOperation);
    switch (binaryOperation)
    case (is JArithmeticOp) { return arithmeticOperationToCeylon(binaryOperation); }
    case (is JBitwiseOp) { return setOperationToCeylon(binaryOperation); }
    case (is JScaleOp) { return scaleOperationToCeylon(binaryOperation); }
    case (is JRangeOp) { return spanOperationToCeylon(binaryOperation); }
    case (is JSegmentOp) { return measureOperationToCeylon(binaryOperation); }
    case (is JEntryOp) { return entryOperationToCeylon(binaryOperation); }
    case (is JInOp) { return inOperationToCeylon(binaryOperation); }
    case (is JComparisonOp) { return comparisonOperationToCeylon(binaryOperation); }
    case (is JCompareOp) { return compareOperationToCeylon(binaryOperation); }
    case (is JEqualityOp|JIdenticalOp) { return equalityOperationToCeylon(binaryOperation); }
    case (is JLogicalOp) { return logicalOperationToCeylon(binaryOperation); }
    case (is JThenOp) { return thenOperationToCeylon(binaryOperation); }
    case (is JDefaultOp) { return elseOperationToCeylon(binaryOperation); }
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

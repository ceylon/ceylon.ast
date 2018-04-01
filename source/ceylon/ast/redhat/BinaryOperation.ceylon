import ceylon.ast.core {
    BinaryOperation,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JArithmeticOp=ArithmeticOp,
        JAssignmentOp=AssignmentOp,
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
shared BinaryOperation binaryOperationToCeylon(JBinaryOperatorExpression binaryOperation, Anything(JNode, Node) update = noop) {
    assert (is JArithmeticOp|JBitwiseOp|JScaleOp|JRangeOp|JSegmentOp|JEntryOp|JInOp|JComparisonOp|JCompareOp|JEqualityOp|JIdenticalOp|JLogicalOp|JThenOp|JDefaultOp|JAssignmentOp binaryOperation);
    switch (binaryOperation)
    case (is JArithmeticOp) { return arithmeticOperationToCeylon(binaryOperation, update); }
    case (is JBitwiseOp) { return setOperationToCeylon(binaryOperation, update); }
    case (is JScaleOp) { return scaleOperationToCeylon(binaryOperation, update); }
    case (is JRangeOp) { return spanOperationToCeylon(binaryOperation, update); }
    case (is JSegmentOp) { return measureOperationToCeylon(binaryOperation, update); }
    case (is JEntryOp) { return entryOperationToCeylon(binaryOperation, update); }
    case (is JInOp) { return inOperationToCeylon(binaryOperation, update); }
    case (is JComparisonOp) { return comparisonOperationToCeylon(binaryOperation, update); }
    case (is JCompareOp) { return compareOperationToCeylon(binaryOperation, update); }
    case (is JEqualityOp|JIdenticalOp) { return equalityOperationToCeylon(binaryOperation, update); }
    case (is JLogicalOp) { return logicalOperationToCeylon(binaryOperation, update); }
    case (is JThenOp) { return thenOperationToCeylon(binaryOperation, update); }
    case (is JDefaultOp) { return elseOperationToCeylon(binaryOperation, update); }
    case (is JAssignmentOp) { return assignmentOperationToCeylon(binaryOperation, update); }
}

"Parses the given [[code]] for a Binary Operation
 into a [[BinaryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared BinaryOperation? parseBinaryOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JBinaryOperatorExpression jBinaryOperation = createParser(code).assignmentExpression()) {
        return binaryOperationToCeylon(jBinaryOperation, update);
    } else {
        return null;
    }
}

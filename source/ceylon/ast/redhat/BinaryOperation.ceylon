import ceylon.ast.core {
    BinaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticOp=ArithmeticOp,
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JBitwiseOp=BitwiseOp,
        JScaleOp=ScaleOp
    }
}

"Converts a RedHat AST [[BinaryOperatorExpression|JBinaryOperatorExpression]] to a `ceylon.ast` [[BinaryOperation]]."
shared BinaryOperation binaryOperationToCeylon(JBinaryOperatorExpression binaryOperation) {
    assert (is JArithmeticOp|JBitwiseOp|JScaleOp binaryOperation);
    switch (binaryOperation)
    case (is JArithmeticOp) { return arithmeticOperationToCeylon(binaryOperation); }
    case (is JBitwiseOp) { return setOperationToCeylon(binaryOperation); }
    case (is JScaleOp) { return scaleOperationToCeylon(binaryOperation); }
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

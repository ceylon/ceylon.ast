import ceylon.ast.core {
    ArithmeticAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAddAssignOp=AddAssignOp,
        JArithmeticAssignmentOp=ArithmeticAssignmentOp,
        JDivideAssignOp=DivideAssignOp,
        JMultiplyAssignOp=MultiplyAssignOp,
        JRemainderAssignOp=RemainderAssignOp,
        JSubtractAssignOp=SubtractAssignOp
    }
}

"Converts a RedHat AST [[ArithmeticAssignmentOp|JArithmeticAssignmentOp]] to a `ceylon.ast` [[ArithmeticAssignmentOperation]]."
shared ArithmeticAssignmentOperation arithmeticAssignmentOperationToCeylon(JArithmeticAssignmentOp arithmeticAssignmentOperation) {
    assert (is JAddAssignOp|JSubtractAssignOp|JMultiplyAssignOp|JDivideAssignOp|JRemainderAssignOp arithmeticAssignmentOperation);
    switch (arithmeticAssignmentOperation)
    case (is JAddAssignOp) { return addAssignmentOperationToCeylon(arithmeticAssignmentOperation); }
    case (is JSubtractAssignOp) { return subtractAssignmentOperationToCeylon(arithmeticAssignmentOperation); }
    case (is JMultiplyAssignOp) { return multiplyAssignmentOperationToCeylon(arithmeticAssignmentOperation); }
    case (is JDivideAssignOp) { return divideAssignmentOperationToCeylon(arithmeticAssignmentOperation); }
    case (is JRemainderAssignOp) { return remainderAssignmentOperationToCeylon(arithmeticAssignmentOperation); }
}

"Compiles the given [[code]] for an Arithmetic Assignment Operation
 into an [[ArithmeticAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared ArithmeticAssignmentOperation? compileArithmeticAssignmentOperation(String code) {
    if (is JArithmeticAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return arithmeticAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}

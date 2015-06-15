import ceylon.ast.core {
    ArithmeticAssignmentOperation,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared ArithmeticAssignmentOperation arithmeticAssignmentOperationToCeylon(JArithmeticAssignmentOp arithmeticAssignmentOperation, Anything(JNode,Node) update = noop) {
    assert (is JAddAssignOp|JSubtractAssignOp|JMultiplyAssignOp|JDivideAssignOp|JRemainderAssignOp arithmeticAssignmentOperation);
    switch (arithmeticAssignmentOperation)
    case (is JAddAssignOp) { return addAssignmentOperationToCeylon(arithmeticAssignmentOperation, update); }
    case (is JSubtractAssignOp) { return subtractAssignmentOperationToCeylon(arithmeticAssignmentOperation, update); }
    case (is JMultiplyAssignOp) { return multiplyAssignmentOperationToCeylon(arithmeticAssignmentOperation, update); }
    case (is JDivideAssignOp) { return divideAssignmentOperationToCeylon(arithmeticAssignmentOperation, update); }
    case (is JRemainderAssignOp) { return remainderAssignmentOperationToCeylon(arithmeticAssignmentOperation, update); }
}

"Compiles the given [[code]] for an Arithmetic Assignment Operation
 into an [[ArithmeticAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared ArithmeticAssignmentOperation? compileArithmeticAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JArithmeticAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return arithmeticAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}

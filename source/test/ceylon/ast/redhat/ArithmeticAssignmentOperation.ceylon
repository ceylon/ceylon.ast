import ceylon.ast.core {
    ArithmeticAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    arithmeticAssignmentOperationToCeylon,
    parseArithmeticAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticAssignmentOp=ArithmeticAssignmentOp
    }
}

shared object arithmeticAssignmentOperation satisfies AbstractTest<ArithmeticAssignmentOperation,JArithmeticAssignmentOp> {
    parse = parseArithmeticAssignmentOperation;
    fromCeylon = RedHatTransformer.transformArithmeticAssignmentOperation;
    toCeylon = arithmeticAssignmentOperationToCeylon;
    
    tests = [addAssignmentOperation, subtractAssignmentOperation, multiplyAssignmentOperation, divideAssignmentOperation, remainderAssignmentOperation];
}

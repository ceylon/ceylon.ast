import ceylon.ast.core {
    ArithmeticAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    arithmeticAssignmentOperationToCeylon,
    compileArithmeticAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticAssignmentOp=ArithmeticAssignmentOp
    }
}

shared object arithmeticAssignmentOperation satisfies AbstractTest<ArithmeticAssignmentOperation,JArithmeticAssignmentOp> {
    compile = compileArithmeticAssignmentOperation;
    fromCeylon = RedHatTransformer.transformArithmeticAssignmentOperation;
    toCeylon = arithmeticAssignmentOperationToCeylon;
    
    tests = [addAssignmentOperation, subtractAssignmentOperation, multiplyAssignmentOperation, divideAssignmentOperation, remainderAssignmentOperation];
}

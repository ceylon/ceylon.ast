import ceylon.ast.core {
    AssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assignmentOperationToCeylon,
    compileAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignmentOp=AssignmentOp
    }
}

shared object assignmentOperation satisfies AbstractTest<AssignmentOperation,JAssignmentOp> {
    compile = compileAssignmentOperation;
    fromCeylon = RedHatTransformer.transformAssignmentOperation;
    toCeylon = assignmentOperationToCeylon;
    
    tests = [assignOperation, arithmeticAssignmentOperation, setAssignmentOperation];
}

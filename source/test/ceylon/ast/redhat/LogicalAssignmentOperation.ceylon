import ceylon.ast.core {
    LogicalAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    logicalAssignmentOperationToCeylon,
    compileLogicalAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLogicalAssignmentOp=LogicalAssignmentOp
    }
}

shared object logicalAssignmentOperation satisfies AbstractTest<LogicalAssignmentOperation,JLogicalAssignmentOp> {
    compile = compileLogicalAssignmentOperation;
    fromCeylon = RedHatTransformer.transformLogicalAssignmentOperation;
    toCeylon = logicalAssignmentOperationToCeylon;
    
    tests = [andAssignmentOperation, orAssignmentOperation];
}

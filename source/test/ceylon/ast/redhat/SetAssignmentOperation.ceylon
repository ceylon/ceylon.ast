import ceylon.ast.core {
    SetAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    setAssignmentOperationToCeylon,
    parseSetAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBitwiseAssignmentOp=BitwiseAssignmentOp
    }
}

shared object setAssignmentOperation satisfies AbstractTest<SetAssignmentOperation,JBitwiseAssignmentOp> {
    parse = parseSetAssignmentOperation;
    fromCeylon = RedHatTransformer.transformSetAssignmentOperation;
    toCeylon = setAssignmentOperationToCeylon;
    
    tests = [intersectAssignmentOperation, unionAssignmentOperation, complementAssignmentOperation];
}

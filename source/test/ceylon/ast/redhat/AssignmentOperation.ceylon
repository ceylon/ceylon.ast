import ceylon.ast.core {
    AssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assignmentOperationToCeylon,
    parseAssignmentOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignmentOp=AssignmentOp
    }
}

shared object assignmentOperation satisfies AbstractTest<AssignmentOperation,JAssignmentOp> {
    parse = parseAssignmentOperation;
    fromCeylon = RedHatTransformer.transformAssignmentOperation;
    toCeylon = assignmentOperationToCeylon;
    
    tests = [assignOperation, arithmeticAssignmentOperation, setAssignmentOperation, logicalAssignmentOperation];
}

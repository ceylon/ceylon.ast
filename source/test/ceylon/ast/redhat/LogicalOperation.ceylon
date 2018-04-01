import ceylon.ast.core {
    LogicalOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    logicalOperationToCeylon,
    parseLogicalOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JLogicalOp=LogicalOp
    }
}

shared object logicalOperation satisfies AbstractTest<LogicalOperation,JLogicalOp> {
    parse = parseLogicalOperation;
    fromCeylon = RedHatTransformer.transformLogicalOperation;
    toCeylon = logicalOperationToCeylon;
    
    tests = [andOperation, orOperation];
}

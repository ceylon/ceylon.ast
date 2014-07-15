import ceylon.ast.core {
    LogicalOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    logicalOperationToCeylon,
    compileLogicalOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLogicalOp=LogicalOp
    }
}

shared object logicalOperation satisfies AbstractTest<LogicalOperation,JLogicalOp> {
    compile = compileLogicalOperation;
    fromCeylon = RedHatTransformer.transformLogicalOperation;
    toCeylon = logicalOperationToCeylon;
    
    tests = [andOperation, orOperation];
}

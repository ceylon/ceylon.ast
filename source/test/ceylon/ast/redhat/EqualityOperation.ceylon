import ceylon.ast.core {
    EqualityOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    equalityOperationToCeylon,
    compileEqualityOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEqualityOp=EqualityOp,
        JIdenticalOp=IdenticalOp
    }
}

shared object equalityOperation satisfies AbstractTest<EqualityOperation,JEqualityOp|JIdenticalOp> {
    compile = compileEqualityOperation;
    fromCeylon = RedHatTransformer.transformEqualityOperation;
    toCeylon = equalityOperationToCeylon;
    
    tests = [equalOperation, notEqualOperation, identicalOperation];
}

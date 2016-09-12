import ceylon.ast.core {
    EqualityOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    equalityOperationToCeylon,
    parseEqualityOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEqualityOp=EqualityOp,
        JIdenticalOp=IdenticalOp
    }
}

shared object equalityOperation satisfies AbstractTest<EqualityOperation,JEqualityOp|JIdenticalOp> {
    parse = parseEqualityOperation;
    fromCeylon = RedHatTransformer.transformEqualityOperation;
    toCeylon = equalityOperationToCeylon;
    
    tests = [equalOperation, notEqualOperation, identicalOperation];
}

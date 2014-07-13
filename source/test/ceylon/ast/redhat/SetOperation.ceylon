import ceylon.ast.core {
    SetOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    setOperationToCeylon,
    compileSetOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBitwiseOp=BitwiseOp
    }
}

shared object setOperation satisfies AbstractTest<SetOperation,JBitwiseOp> {
    compile = compileSetOperation;
    fromCeylon = RedHatTransformer.transformSetOperation;
    toCeylon = setOperationToCeylon;
    
    tests = [intersectionOperation, unionOperation, complementOperation];
}

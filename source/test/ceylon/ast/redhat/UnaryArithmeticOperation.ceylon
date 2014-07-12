import ceylon.ast.core {
    UnaryArithmeticOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryArithmeticOperationToCeylon,
    compileUnaryArithmeticOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNegativeOp=NegativeOp,
        JPositiveOp=PositiveOp
    }
}

shared object unaryArithmeticOperation satisfies AbstractTest<UnaryArithmeticOperation,JNegativeOp|JPositiveOp> {
    compile = compileUnaryArithmeticOperation;
    fromCeylon = RedHatTransformer.transformUnaryArithmeticOperation;
    toCeylon = unaryArithmeticOperationToCeylon;
    
    tests = [identityOperation, negationOperation];
}

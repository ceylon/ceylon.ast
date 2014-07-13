import ceylon.ast.core {
    ArithmeticOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    arithmeticOperationToCeylon,
    compileArithmeticOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticOp=ArithmeticOp
    }
}

shared object arithmeticOperation satisfies AbstractTest<ArithmeticOperation,JArithmeticOp> {
    compile = compileArithmeticOperation;
    fromCeylon = RedHatTransformer.transformArithmeticOperation;
    toCeylon = arithmeticOperationToCeylon;
    
    tests = [exponentiationOperation, productOperation, quotientOperation, remainderOperation];
}

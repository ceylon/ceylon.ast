import ceylon.ast.core {
    UnaryIshOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryIshOperationToCeylon,
    compileUnaryIshOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

shared object unaryIshOperation satisfies AbstractTest<UnaryIshOperation,JUnaryOperatorExpression> {
    compile = compileUnaryIshOperation;
    fromCeylon = RedHatTransformer.transformUnaryIshOperation;
    toCeylon = unaryIshOperationToCeylon;
    
    tests = [unaryOperation, unaryTypeOperation];
}

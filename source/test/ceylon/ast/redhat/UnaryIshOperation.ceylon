import ceylon.ast.core {
    UnaryIshOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryIshOperationToCeylon,
    parseUnaryIshOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

shared object unaryIshOperation satisfies AbstractTest<UnaryIshOperation,JUnaryOperatorExpression> {
    parse = parseUnaryIshOperation;
    fromCeylon = RedHatTransformer.transformUnaryIshOperation;
    toCeylon = unaryIshOperationToCeylon;
    
    tests = [unaryOperation, unaryTypeOperation];
}

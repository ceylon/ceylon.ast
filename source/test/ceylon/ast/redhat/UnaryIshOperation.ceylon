import ceylon.ast.core {
    UnaryIshOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryIshOperationToCeylon,
    parseUnaryIshOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
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

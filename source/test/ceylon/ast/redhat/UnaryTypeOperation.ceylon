import ceylon.ast.core {
    UnaryTypeOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryTypeOperationToCeylon,
    parseUnaryTypeOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeOperatorExpression=TypeOperatorExpression
    }
}

shared object unaryTypeOperation satisfies AbstractTest<UnaryTypeOperation,JTypeOperatorExpression> {
    parse = parseUnaryTypeOperation;
    fromCeylon = RedHatTransformer.transformUnaryTypeOperation;
    toCeylon = unaryTypeOperationToCeylon;
    
    tests = [isOperation, ofOperation];
}

import ceylon.ast.core {
    UnaryTypeOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryTypeOperationToCeylon,
    compileUnaryTypeOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeOperatorExpression=TypeOperatorExpression
    }
}

shared object unaryTypeOperation satisfies AbstractTest<UnaryTypeOperation,JTypeOperatorExpression> {
    compile = compileUnaryTypeOperation;
    fromCeylon = RedHatTransformer.transformUnaryTypeOperation;
    toCeylon = unaryTypeOperationToCeylon;
    
    tests = [isOperation, ofOperation];
}

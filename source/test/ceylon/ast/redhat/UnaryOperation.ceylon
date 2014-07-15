import ceylon.ast.core {
    UnaryOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryOperationToCeylon,
    compileUnaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

shared object unaryOperation satisfies AbstractTest<UnaryOperation,JUnaryOperatorExpression> {
    compile = compileUnaryOperation;
    fromCeylon = RedHatTransformer.transformUnaryOperation;
    toCeylon = unaryOperationToCeylon;
    
    tests = [postfixOperation, prefixOperation, unaryArithmeticOperation, existsOperation, nonemptyOperation, notOperation];
}

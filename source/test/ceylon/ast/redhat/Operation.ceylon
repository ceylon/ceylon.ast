import ceylon.ast.core {
    Operation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    operationToCeylon,
    compileOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOperatorExpression=OperatorExpression
    }
}

shared object operation satisfies AbstractTest<Operation,JOperatorExpression> {
    compile = compileOperation;
    fromCeylon = RedHatTransformer.transformOperation;
    toCeylon = operationToCeylon;
    
    tests = [unaryOperation];
}

import ceylon.ast.core {
    Operation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    operationToCeylon,
    parseOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOperatorExpression=OperatorExpression
    }
}

shared object operation satisfies AbstractTest<Operation,JOperatorExpression> {
    parse = parseOperation;
    fromCeylon = RedHatTransformer.transformOperation;
    toCeylon = operationToCeylon;
    
    tests = [unaryIshOperation, binaryOperation, withinOperation];
}

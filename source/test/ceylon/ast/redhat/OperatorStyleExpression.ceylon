import ceylon.ast.core {
    OperatorStyleExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    operatorStyleExpressionToCeylon,
    compileOperatorStyleExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression,
        JQualifiedMemberExpression=QualifiedMemberExpression
    }
}

shared object operatorStyleExpression satisfies AbstractTest<OperatorStyleExpression,JQualifiedMemberExpression|JInvocationExpression> {
    compile = compileOperatorStyleExpression;
    fromCeylon = RedHatTransformer.transformOperatorStyleExpression;
    toCeylon = operatorStyleExpressionToCeylon;
    
    tests = [operatorStyleMemberExpression];
}

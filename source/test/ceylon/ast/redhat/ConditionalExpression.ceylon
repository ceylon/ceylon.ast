import ceylon.ast.core {
    ConditionalExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    conditionalExpressionToCeylon,
    compileConditionalExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfExpression=IfExpression
    }
}

shared object conditionalExpression satisfies AbstractTest<ConditionalExpression,JIfExpression> {
    compile = compileConditionalExpression;
    fromCeylon = RedHatTransformer.transformConditionalExpression;
    toCeylon = conditionalExpressionToCeylon;
    
    tests = [ifElseExpression];
}

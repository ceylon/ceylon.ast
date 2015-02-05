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
        JIfExpression=IfExpression,
        JSwitchExpression=SwitchExpression
    }
}

shared object conditionalExpression satisfies AbstractTest<ConditionalExpression,JIfExpression|JSwitchExpression> {
    compile = compileConditionalExpression;
    fromCeylon = RedHatTransformer.transformConditionalExpression;
    toCeylon = conditionalExpressionToCeylon;
    
    tests = [ifElseExpression, switchCaseElseExpression];
}

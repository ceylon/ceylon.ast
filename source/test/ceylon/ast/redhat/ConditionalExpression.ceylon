import ceylon.ast.core {
    ConditionalExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    conditionalExpressionToCeylon,
    parseConditionalExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JIfExpression=IfExpression,
        JSwitchExpression=SwitchExpression
    }
}

shared object conditionalExpression satisfies AbstractTest<ConditionalExpression,JIfExpression|JSwitchExpression> {
    parse = parseConditionalExpression;
    fromCeylon = RedHatTransformer.transformConditionalExpression;
    toCeylon = conditionalExpressionToCeylon;
    
    tests = [ifElseExpression, switchCaseElseExpression];
}

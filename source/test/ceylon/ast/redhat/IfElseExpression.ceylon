import ceylon.ast.core {
    Conditions,
    DisjoiningExpression,
    IfElseExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ifElseExpressionToCeylon,
    compileIfElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfExpression=IfExpression
    }
}

shared object ifElseExpression satisfies ConcreteTest<IfElseExpression,JIfExpression> {
    
    String->IfElseExpression construct(String->Conditions conditions, String->DisjoiningExpression thenExpression, String->DisjoiningExpression|IfElseExpression elseExpression)
            => "if ``conditions.key`` then ``thenExpression.key`` else ``elseExpression.key``"->IfElseExpression(conditions.item, thenExpression.item, elseExpression.item);
    
    shared String->IfElseExpression ifThenAElseBExpression = construct(conditions.trueCommaAAndBConditions, baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileIfElseExpression;
    fromCeylon = RedHatTransformer.transformIfElseExpression;
    toCeylon = ifElseExpressionToCeylon;
    codes = [ifThenAElseBExpression];
}

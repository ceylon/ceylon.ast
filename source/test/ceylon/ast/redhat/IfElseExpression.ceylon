import ceylon.ast.core {
    Conditions,
    DisjoiningExpression,
    IfElseExpression,
    LetExpression
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
    
    String->IfElseExpression construct(String->Conditions conditions, String->DisjoiningExpression|IfElseExpression|LetExpression thenExpression, String->DisjoiningExpression|IfElseExpression|LetExpression elseExpression)
            => "if ``conditions.key`` then ``thenExpression.key`` else ``elseExpression.key``"->IfElseExpression(conditions.item, thenExpression.item, elseExpression.item);
    
    shared String->IfElseExpression ifThenAElseBExpression = construct(conditions.trueCommaAAndBConditions, baseExpression.aExpression, baseExpression.bExpression);
    shared String->IfElseExpression ifThenLetElseIfExpression => construct(conditions.trueConditions, letExpression.distLetExpression, ifThenAElseBExpression);
    shared String->IfElseExpression ifThenIfElseLetExpression => construct(conditions.trueConditions, ifThenLetElseIfExpression, letExpression.letIfExpression);
    
    compile = compileIfElseExpression;
    fromCeylon = RedHatTransformer.transformIfElseExpression;
    toCeylon = ifElseExpressionToCeylon;
    codes => [ifThenAElseBExpression, ifThenLetElseIfExpression, ifThenIfElseLetExpression];
}

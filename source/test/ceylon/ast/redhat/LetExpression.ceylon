import ceylon.ast.core {
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    LetValueList,
    LIdentifier,
    SpecifiedVariable
}
import ceylon.ast.redhat {
    RedHatTransformer,
    letExpressionToCeylon,
    compileLetExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLetExpression=LetExpression
    }
}

shared object letExpression satisfies ConcreteTest<LetExpression,JLetExpression> {
    
    String->LetExpression construct([<String->SpecifiedVariable>+] letValues, String->DisjoiningExpression|IfElseExpression|LetExpression expression)
            => "let (``",".join(letValues*.key)``) ``expression.key``"->LetExpression(LetValueList(letValues*.item), expression.item);
    
    shared String->LetExpression distLetExpression = construct(["dist=1"->SpecifiedVariable(LIdentifier("dist"), specifier.oneSpecifier.item)], baseExpression.iExpression);
    shared String->LetExpression abcLetExpression = construct([
            "a=1"->SpecifiedVariable(LIdentifier("a"), specifier.oneSpecifier.item),
            "b=0"->SpecifiedVariable(LIdentifier("b"), specifier._0Specifier.item),
            "c=1"->SpecifiedVariable(LIdentifier("c"), specifier.oneSpecifier.item)],
        sumOperation.aTimesBPlusCExpression);
    shared String->LetExpression letIfExpression => construct(["a=1"->SpecifiedVariable(LIdentifier("a"), specifier.oneSpecifier.item)],ifElseExpression.ifThenAElseBExpression);
    
    compile = compileLetExpression;
    fromCeylon = RedHatTransformer.transformLetExpression;
    toCeylon = letExpressionToCeylon;
    codes => [distLetExpression, abcLetExpression, letIfExpression];
}

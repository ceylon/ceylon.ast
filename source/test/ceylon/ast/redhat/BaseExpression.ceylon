import ceylon.ast.core {
    BaseExpression,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseExpressionToCeylon,
    compileBaseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression
    }
}

shared object baseExpression satisfies ConcreteTest<BaseExpression,JBaseMemberOrTypeExpression> {
    
    String->BaseExpression construct(String name, <String->TypeArguments>? typeArguments = null)
            => (name + (typeArguments?.key else ""))->BaseExpression(MemberNameWithTypeArguments(LIdentifier(name), typeArguments?.item));
    
    shared String->BaseExpression nullExpression = construct("null");
    shared String->BaseExpression maxOfIntegerNothingExpression = construct("max", typeArguments.integerNothingTypeArguments);
    shared String->BaseExpression processExpression = construct("process");
    
    // not tested directly, but used by other tests
    shared String->BaseExpression aExpression = construct("a");
    shared String->BaseExpression bExpression = construct("b");
    shared String->BaseExpression cExpression = construct("c");
    shared String->BaseExpression iExpression = construct("i");
    shared String->BaseExpression trueExpression = construct("true");
    shared String->BaseExpression parsedIntExpression = construct("parsedInt");
    shared String->BaseExpression nameExpression = construct("name");
    shared String->BaseExpression textExpression = construct("text");
    shared String->BaseExpression stepExpression = construct("step");
    shared String->BaseExpression balanceExpression = construct("balance");
    shared String->BaseExpression interestRateExpression = construct("interestRate");
    shared String->BaseExpression incrementExpression = construct("increment");
    shared String->BaseExpression countdownExpression = construct("countdown");
    shared String->BaseExpression \iΔtExpression = "\\iΔt"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("Δt")));
    shared String->BaseExpression printExpression = construct("print");
    shared String->BaseExpression assertionErrorExpression = "AssertionError"->BaseExpression(TypeNameWithTypeArguments(UIdentifier("AssertionError")));
    shared String->BaseExpression keyExpression = construct("key");
    shared String->BaseExpression itemExpression = construct("item");
    shared String->BaseExpression peopleExpression = construct("people");
    shared String->BaseExpression peopleByNameExpression = construct("peopleByName");
    shared String->BaseExpression personExpression = construct("person");
    shared String->BaseExpression lockExpression = construct("lock");
    shared String->BaseExpression countExpression = construct("count");
    
    compile = compileBaseExpression;
    fromCeylon = RedHatTransformer.transformBaseExpression;
    toCeylon = baseExpressionToCeylon;
    codes = [nullExpression, maxOfIntegerNothingExpression];
}

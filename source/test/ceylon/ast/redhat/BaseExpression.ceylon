import ceylon.ast.core {
    BaseExpression,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeArgument,
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
    
    String->BaseExpression construct(String name)
            => name->BaseExpression(MemberNameWithTypeArguments(LIdentifier(name)));
    
    shared String->BaseExpression nullExpression = construct("null");
    shared String->BaseExpression maxOfIntegerNothingExpression = "max<Integer,Nothing>"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("max"), [TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Integer")))), TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"))))]));
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
    
    compile = compileBaseExpression;
    fromCeylon = RedHatTransformer.transformBaseExpression;
    toCeylon = baseExpressionToCeylon;
    codes = [nullExpression, maxOfIntegerNothingExpression];
}

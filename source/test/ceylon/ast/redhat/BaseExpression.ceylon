import ceylon.ast.core {
    BaseExpression,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
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
    shared String->BaseExpression nullExpression = "null"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("null"), null));
    shared String->BaseExpression maxOfIntegerNothingExpression = "max<Integer,Nothing>"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("max"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))), BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing")))]));
    shared String->BaseExpression processExpression = "process"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("process")));
    
    // not tested directly, but used by other tests
    shared String->BaseExpression aExpression = "a"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("a")));
    shared String->BaseExpression bExpression = "b"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("b")));
    shared String->BaseExpression cExpression = "c"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("c")));
    shared String->BaseExpression trueExpression = "true"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("true")));
    
    compile = compileBaseExpression;
    fromCeylon = RedHatTransformer.transformBaseExpression;
    toCeylon = baseExpressionToCeylon;
    codes = [nullExpression, maxOfIntegerNothingExpression];
}

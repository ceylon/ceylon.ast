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
    compile=compileBaseExpression
}
import ceylon.test {
    test
}

test
shared void baseExpression()
        => doTest(compile, RedHatTransformer.transformBaseExpression, baseExpressionToCeylon,
    "null"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("null"), null)),
    "max<Integer,Nothing>"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("max"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))), BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing")))]))
);

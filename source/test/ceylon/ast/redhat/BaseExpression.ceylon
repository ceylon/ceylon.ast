import ceylon.ast.core {
    BaseExpression,
    BaseType,
    LIdentifier,
    NameWithTypeArguments,
    TypeNameWithArguments,
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
    "null"->BaseExpression(NameWithTypeArguments(LIdentifier("null"), null)),
    "max<Integer,Nothing>"->BaseExpression(NameWithTypeArguments(LIdentifier("max"), [BaseType(TypeNameWithArguments(UIdentifier("Integer"))), BaseType(TypeNameWithArguments(UIdentifier("Nothing")))]))
);

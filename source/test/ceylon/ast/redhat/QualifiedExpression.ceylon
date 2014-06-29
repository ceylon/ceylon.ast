import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseExpression,
    LIdentifier,
    NameWithTypeArguments,
    QualifiedExpression,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    qualifiedExpressionToCeylon,
    compile=compileQualifiedExpression
}

test
shared void qualifiedExpression()
        => doTest(compile, RedHatTransformer.transformQualifiedExpression, qualifiedExpressionToCeylon,
    """", ".join"""->QualifiedExpression(StringLiteral(""", """), NameWithTypeArguments(LIdentifier("join"))),
    "process.arguments.first"->QualifiedExpression(
        QualifiedExpression(
            BaseExpression(
                NameWithTypeArguments(LIdentifier("process"))),
            NameWithTypeArguments(LIdentifier("arguments"))),
        NameWithTypeArguments(LIdentifier("first")))
);

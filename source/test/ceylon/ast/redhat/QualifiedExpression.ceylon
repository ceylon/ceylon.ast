import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseExpression,
    LIdentifier,
    MemberNameWithTypeArguments,
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
    """", ".join"""->QualifiedExpression(StringLiteral(""", """), MemberNameWithTypeArguments(LIdentifier("join"))),
    "process.arguments.first"->QualifiedExpression(
        QualifiedExpression(
            BaseExpression(
                MemberNameWithTypeArguments(LIdentifier("process"))),
            MemberNameWithTypeArguments(LIdentifier("arguments"))),
        MemberNameWithTypeArguments(LIdentifier("first")))
);

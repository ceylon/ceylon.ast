import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.core {
    baseExpression,
    qualifiedExpression,
    BaseExpression,
    LIdentifier,
    MemberNameWithTypeArguments,
    QualifiedExpression,
    TypeNameWithTypeArguments,
    UIdentifier
}

test
shared void qualifiedExpressionFunction() {
    assertEquals {
        actual = qualifiedExpression("x", "Y");
        expected = QualifiedExpression(BaseExpression(MemberNameWithTypeArguments(LIdentifier("x"))), TypeNameWithTypeArguments(UIdentifier("Y")));
    };
    assertEquals {
        actual = qualifiedExpression(qualifiedExpression(baseExpression("process"), "arguments"), "first");
        expected = QualifiedExpression {
            receiverExpression = QualifiedExpression {
                receiverExpression = BaseExpression(MemberNameWithTypeArguments(LIdentifier("process")));
                nameAndArgs = MemberNameWithTypeArguments(LIdentifier("arguments"));
            };
            nameAndArgs = MemberNameWithTypeArguments(LIdentifier("first"));
        };
        // this is why we need that function
    };
}

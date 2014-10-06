import ceylon.ast.core {
    BaseExpression,
    LIdentifier,
    MemberNameWithTypeArguments,
    QualifiedExpression,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.create {
    createBaseExpression=baseExpression,
    createQualifiedExpression=qualifiedExpression
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void qualifiedExpression() {
    assertEquals {
        actual = createQualifiedExpression("x", "Y");
        expected = QualifiedExpression(BaseExpression(MemberNameWithTypeArguments(LIdentifier("x"))), TypeNameWithTypeArguments(UIdentifier("Y")));
    };
    assertEquals {
        actual = createQualifiedExpression(createQualifiedExpression(createBaseExpression("process"), "arguments"), "first");
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

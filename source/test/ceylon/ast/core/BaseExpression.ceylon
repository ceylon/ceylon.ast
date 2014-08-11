import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.core {
    baseExpression,
    BaseExpression,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}

test
shared void baseExpressionFunction() {
    assertEquals {
        actual = baseExpression("null");
        expected = BaseExpression(MemberNameWithTypeArguments(LIdentifier("null")));
    };
    assertEquals {
        actual = baseExpression("String");
        expected = BaseExpression(TypeNameWithTypeArguments(UIdentifier("String")));
    };
    assertEquals {
        actual = baseExpression("emptyOrSingleton", "Integer");
        expected = BaseExpression(MemberNameWithTypeArguments(LIdentifier("emptyOrSingleton"), TypeArguments([TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))))])));
        // this is why we need that function
    };
}

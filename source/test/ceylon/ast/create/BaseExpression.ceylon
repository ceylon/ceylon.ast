import ceylon.ast.core {
    BaseExpression,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.create {
    createBaseExpression=baseExpression
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void baseExpression() {
    assertEquals {
        actual = createBaseExpression("null");
        expected = BaseExpression(MemberNameWithTypeArguments(LIdentifier("null")));
    };
    assertEquals {
        actual = createBaseExpression("String");
        expected = BaseExpression(TypeNameWithTypeArguments(UIdentifier("String")));
    };
    assertEquals {
        actual = createBaseExpression("emptyOrSingleton", "Integer");
        expected = BaseExpression(MemberNameWithTypeArguments(LIdentifier("emptyOrSingleton"), TypeArguments([TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))))])));
        // this is why we need that function
    };
}

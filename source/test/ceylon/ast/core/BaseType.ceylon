import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.core {
    baseType,
    BaseType,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
test
shared void baseTypeFunction() {
    assertEquals {
        actual = baseType("String");
        expected = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
    };
    assertEquals {
        actual = baseType("Iterable", "String", "Nothing");
        expected = BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), TypeArguments([
                        TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("String")))),
                        TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"))))
                    ])));
        // this is why we need that function
    };
}

import ceylon.ast.core {
    BaseType,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.create {
    createBaseType=baseType
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void baseType() {
    assertEquals {
        actual = createBaseType("String");
        expected = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
    };
    assertEquals {
        actual = createBaseType("Iterable", "String", "Nothing");
        expected = BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), TypeArguments([
                        TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("String")))),
                        TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"))))
                    ])));
        // this is why we need that function
    };
}

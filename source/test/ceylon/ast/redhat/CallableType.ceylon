import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    CallableType,
    DefaultedType,
    OptionalType,
    TupleType,
    TypeList,
    TypeNameWithTypeArguments,
    UIdentifier,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    callableTypeToCeylon,
    compile=compileCallableType
}

test
shared void callableType()
        => doTest(compile, RedHatTransformer.transformCallableType, callableTypeToCeylon,
    "Anything()"->CallableType(BaseType(TypeNameWithTypeArguments(UIdentifier("Anything"))), TypeList([])),
    "[Float+]?(String+)"->CallableType(
        OptionalType(TupleType(TypeList([], VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("Float"))), true)))),
        TypeList([], VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))), true))),
    "Nothing(Integer,Float=,String*)"->CallableType(BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"))), TypeList([
                BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithTypeArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))), false)
        ))
);

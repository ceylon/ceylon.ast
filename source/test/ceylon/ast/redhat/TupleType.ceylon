import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    DefaultedType,
    TupleType,
    TypeList,
    TypeNameWithTypeArguments,
    UIdentifier,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    tupleTypeToCeylon,
    compile=compileTupleType
}

test
shared void tupleType()
        => doTest(compile, RedHatTransformer.transformTupleType, tupleTypeToCeylon,
    "[]"->TupleType(TypeList([])),
    "[String+]"->TupleType(TypeList([], VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))), true))),
    "[Integer,Float=,String*]"->TupleType(TypeList([
                BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithTypeArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))), false)
        ))
);

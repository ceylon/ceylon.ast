import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    DefaultedType,
    TupleType,
    TypeList,
    TypeNameWithArguments,
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
    "[String+]"->TupleType(TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), true))),
    "[Integer,Float=,String*]"->TupleType(TypeList([
                BaseType(TypeNameWithArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), false)
        ))
);

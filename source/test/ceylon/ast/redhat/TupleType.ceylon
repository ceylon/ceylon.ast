import ceylon.test {
    test
}
import ceylon.ast.api {
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
import test.ceylon.ast.redhat {
    testCompilation,
    testConversion
}

test
shared void tupleType()
        => testConversion(RedHatTransformer.transformTupleType, tupleTypeToCeylon,
    TupleType(TypeList([])),
    TupleType(TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), true))),
    TupleType(TypeList([
                BaseType(TypeNameWithArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), false)
        ))
);

test
shared void compileTupleType()
        => testCompilation(compile,
    "[]"->TupleType(TypeList([])),
    "[String+]"->TupleType(TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), true))),
    "[Integer,Float=,String*]"->TupleType(TypeList([
                BaseType(TypeNameWithArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), false)
        ))
);

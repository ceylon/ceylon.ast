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
    TypeNameWithArguments,
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
    "Anything()"->CallableType(BaseType(TypeNameWithArguments(UIdentifier("Anything"))), TypeList([])),
    "[Float+]?(String+)"->CallableType(
        OptionalType(TupleType(TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("Float"))), true)))),
        TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), true))),
    "Nothing(Integer,Float=,String*)"->CallableType(BaseType(TypeNameWithArguments(UIdentifier("Nothing"))), TypeList([
                BaseType(TypeNameWithArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), false)
        ))
);

import ceylon.test {
    test
}
import ceylon.ast.api {
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
        => testConversion(RedHatTransformer.transformCallableType, callableTypeToCeylon,
    CallableType(BaseType(TypeNameWithArguments(UIdentifier("Anything"))), TypeList([])),
    CallableType(
        OptionalType(TupleType(TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("Float"))), true)))),
        TypeList([], VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), true))),
    CallableType(BaseType(TypeNameWithArguments(UIdentifier("Nothing"))), TypeList([
                BaseType(TypeNameWithArguments(UIdentifier("Integer"))),
                DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Float"))))
            ],
            VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"))), false)
        ))
);

test
shared void compileCallableType()
        => testCompilation(compile,
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

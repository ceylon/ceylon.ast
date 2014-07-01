import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    DefaultedType,
    EntryType,
    TupleType,
    TypeList,
    TypeMeta,
    TypeNameWithTypeArguments,
    UIdentifier,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeMetaToCeylon,
    compile=compileTypeMeta
}

test
shared void typeMeta()
        => doTest(compile, RedHatTransformer.transformTypeMeta, typeMetaToCeylon,
    "`[Integer,Float=,String*]`"->TypeMeta(TupleType(TypeList([
                    BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))),
                    DefaultedType(BaseType(TypeNameWithTypeArguments(UIdentifier("Float"))))
                ],
                VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))), false)
            ))),
    "`String->Iterable<String>`"->TypeMeta(EntryType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null)),
            BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))]))))
);

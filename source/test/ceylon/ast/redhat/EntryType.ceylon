import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    EntryType,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    entryTypeToCeylon,
    compile=compileEntryType
}

test
shared void entryType()
        => doTest(compile, RedHatTransformer.transformEntryType, entryTypeToCeylon,
    "String->Iterable<String>"->EntryType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null)),
        BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])))
);

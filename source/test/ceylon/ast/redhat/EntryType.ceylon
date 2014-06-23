import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    EntryType,
    TypeNameWithArguments,
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
    "String->Iterable<String>"->EntryType(BaseType(TypeNameWithArguments(UIdentifier("String"), null)),
        BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);

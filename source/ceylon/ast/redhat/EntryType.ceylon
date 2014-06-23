import ceylon.ast.api {
    EntryType,
    MainType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEntryType=EntryType
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[EntryType|JEntryType]] to a `ceylon.ast` [[EntryType]]."
shared EntryType entryTypeToCeylon(JEntryType entryType) {
    assert (is MainType key = typeToCeylon(entryType.keyType));
    assert (is MainType item = typeToCeylon(entryType.valueType));
    return EntryType(key, item);
}

"Compiles the given [[code]] for an Entry Type
 into an [[EntryType]] using the Ceylon compiler
 (more specifically, the rule for a `type`)."
shared EntryType? compileEntryType(String code) {
    if (is JEntryType jEntryType = createParser(code).type()) {
        return entryTypeToCeylon(jEntryType);
    } else {
        return null;
    }
}

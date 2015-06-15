import ceylon.ast.core {
    EntryType,
    MainType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEntryType=EntryType
    }
}

"Converts a RedHat AST [[EntryType|JEntryType]] to a `ceylon.ast` [[EntryType]]."
shared EntryType entryTypeToCeylon(JEntryType entryType, Anything(JNode,Node) update = noop) {
    assert (is MainType key = typeToCeylon(entryType.keyType, update));
    assert (is MainType item = typeToCeylon(entryType.valueType, update));
    value result = EntryType(key, item);
    update(entryType, result);
    return result;
}

"Compiles the given [[code]] for an Entry Type
 into an [[EntryType]] using the Ceylon compiler
 (more specifically, the rule for a `type`)."
shared EntryType? compileEntryType(String code, Anything(JNode,Node) update = noop) {
    if (is JEntryType jEntryType = createParser(code).type()) {
        return entryTypeToCeylon(jEntryType, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    EntryPattern,
    Node,
    TuplePattern,
    VariablePattern
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JKeyValuePattern=KeyValuePattern
    }
}

"Converts a RedHat AST [[KeyValuePattern|JKeyValuePattern]] to a `ceylon.ast` [[EntryPattern]]."
shared EntryPattern entryPatternToCeylon(JKeyValuePattern entryPattern, Anything(JNode, Node) update = noop) {
    assert (is VariablePattern|TuplePattern key = patternToCeylon(entryPattern.key, update),
        is VariablePattern|TuplePattern item = patternToCeylon(entryPattern.\ivalue, update));
    value result = EntryPattern(key, item);
    update(entryPattern, result);
    return result;
}

"Parses the given [[code]] for an Entry Pattern
 into an [[EntryPattern]] using the Ceylon compiler
 (more specifically, the rule for an `keyItemPattern`)."
shared EntryPattern? parseEntryPattern(String code, Anything(JNode, Node) update = noop) {
    if (exists jEntryPattern = createParser(code).keyItemPattern()) {
        return entryPatternToCeylon(jEntryPattern, update);
    } else {
        return null;
    }
}

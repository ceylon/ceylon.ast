import ceylon.ast.core {
    EntryPattern,
    TuplePattern,
    VariablePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JKeyValuePattern=KeyValuePattern
    }
}

"Converts a RedHat AST [[KeyValuePattern|JKeyValuePattern]] to a `ceylon.ast` [[EntryPattern]]."
shared EntryPattern entryPatternToCeylon(JKeyValuePattern entryPattern) {
    assert (is VariablePattern|TuplePattern key = patternToCeylon(entryPattern.key),
        is VariablePattern|TuplePattern item = patternToCeylon(entryPattern.\ivalue));
    return EntryPattern(key, item);
}

"Compiles the given [[code]] for an Entry Pattern
 into an [[EntryPattern]] using the Ceylon compiler
 (more specifically, the rule for an `keyItemPattern`)."
shared EntryPattern? compileEntryPattern(String code) {
    if (exists jEntryPattern = createParser(code).keyItemPattern()) {
        return entryPatternToCeylon(jEntryPattern);
    } else {
        return null;
    }
}

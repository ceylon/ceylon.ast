import ceylon.ast.core {
    Pattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JKeyValuePattern=KeyValuePattern,
        JPattern=Pattern,
        JTuplePattern=TuplePattern,
        JVariablePattern=VariablePattern
    }
}

"Converts a RedHat AST [[Pattern|JPattern]] to a `ceylon.ast` [[Pattern]]."
shared Pattern patternToCeylon(JPattern pattern) {
    assert (is JVariablePattern|JTuplePattern|JKeyValuePattern pattern);
    switch (pattern)
    case (is JVariablePattern) { return variablePatternToCeylon(pattern); }
    case (is JTuplePattern) { return tuplePatternToCeylon(pattern); }
    case (is JKeyValuePattern) { return entryPatternToCeylon(pattern); }
}

"Compiles the given [[code]] for a Pattern
 into a [[Pattern]] using the Ceylon compiler
 (more specifically, the rule for a `pattern`)."
shared Pattern? compilePattern(String code) {
    if (exists jPattern = createParser(code).pattern()) {
        return patternToCeylon(jPattern);
    } else {
        return null;
    }
}

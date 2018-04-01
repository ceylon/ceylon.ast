import ceylon.ast.core {
    Node,
    Pattern
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JKeyValuePattern=KeyValuePattern,
        JPattern=Pattern,
        JTuplePattern=TuplePattern,
        JVariablePattern=VariablePattern
    }
}

"Converts a RedHat AST [[Pattern|JPattern]] to a `ceylon.ast` [[Pattern]]."
shared Pattern patternToCeylon(JPattern pattern, Anything(JNode, Node) update = noop) {
    assert (is JVariablePattern|JTuplePattern|JKeyValuePattern pattern);
    switch (pattern)
    case (is JVariablePattern) { return variablePatternToCeylon(pattern, update); }
    case (is JTuplePattern) { return tuplePatternToCeylon(pattern, update); }
    case (is JKeyValuePattern) { return entryPatternToCeylon(pattern, update); }
}

"Parses the given [[code]] for a Pattern
 into a [[Pattern]] using the Ceylon compiler
 (more specifically, the rule for a `pattern`)."
shared Pattern? parsePattern(String code, Anything(JNode, Node) update = noop) {
    if (exists jPattern = createParser(code + ",").pattern()) {
        // the parser needs that comma for some patterns
        return patternToCeylon(jPattern, update);
    } else {
        return null;
    }
}

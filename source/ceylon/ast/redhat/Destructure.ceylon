import ceylon.ast.core {
    Destructure,
    EntryPattern,
    Node,
    PatternList,
    TuplePattern
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLetStatement=LetStatement
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[LetStatement|JLetStatement]] to a `ceylon.ast` [[Destructure]]."
shared Destructure destructureToCeylon(JLetStatement letStatement, Anything(JNode, Node) update = noop) {
    value letValues = CeylonIterable(letStatement.variables).collect(propagateUpdate(specifiedPatternToCeylon, update));
    "Must have at least one `let` value"
    assert (nonempty letValues);
    value patternList = PatternList(letValues);
    update(letStatement, patternList);
    value result = Destructure(patternList);
    update(letStatement, result);
    return result;
}

"Parses the given [[code]] for a Destructure
 into a [[Destructure]] using the Ceylon compiler
 (more specifically, the rule for a `declarationOrStatement`)."
shared Destructure? parseDestructure(String code, Anything(JNode, Node) update = noop) {
    if (is JLetStatement jDestructure = createParser(code).declarationOrStatement()) {
        // only declarationOrStatements includes both old syntax (destructure) and new syntax (destructure2)
        return destructureToCeylon(jDestructure, update);
    } else {
        return null;
    }
}

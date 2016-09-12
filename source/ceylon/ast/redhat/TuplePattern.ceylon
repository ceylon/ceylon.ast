import ceylon.ast.core {
    Node,
    TuplePattern,
    UnionType,
    VariadicVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSequencedType=SequencedType,
        JStaticType=StaticType,
        JTuplePattern=TuplePattern,
        JValueModifier=ValueModifier,
        JVariablePattern=VariablePattern
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TuplePattern|JTuplePattern]] to a `ceylon.ast` [[TuplePattern]]."
shared TuplePattern tuplePatternToCeylon(JTuplePattern tuplePattern, Anything(JNode,Node) update = noop) {
    value patterns = CeylonIterable(tuplePattern.patterns).sequence();
    "Empty tuple pattern not allowed"
    assert (exists lastPattern = patterns.last);
    TuplePattern result;
    if (is JVariablePattern lastPattern, lastPattern.variable.type is JSequencedType) {
        // variadic
        UnionType? variadicType;
        assert (is JSequencedType jType = lastPattern.variable.type);
        if (is JValueModifier jElementType = jType.type, !jElementType.token exists) {
            // synthetic value modifier
            variadicType = null;
        } else {
            assert (is JStaticType jElementType = jType.type,
                is UnionType t = typeToCeylon(jElementType, update));
            variadicType = t;
        }
        value variadicElementPattern = VariadicVariable(lIdentifierToCeylon(lastPattern.variable.identifier, update), variadicType);
        update(lastPattern.variable, variadicElementPattern);
        value elementPatterns = patterns.reversed.rest.reversed.collect(propagateUpdate(patternToCeylon, update));
        result = TuplePattern(elementPatterns, variadicElementPattern);
    } else {
        // all normal patterns
        assert (nonempty elementPatterns = patterns.collect(propagateUpdate(patternToCeylon, update)));
        result = TuplePattern(elementPatterns);
    }
    update(tuplePattern, result);
    return result;
}

"Parses the given [[code]] for a Tuple Pattern
 into a [[TuplePattern]] using the Ceylon compiler
 (more specifically, the rule for a `tuplePattern`)."
shared TuplePattern? parseTuplePattern(String code, Anything(JNode,Node) update = noop) {
    if (exists jTuplePattern = createParser(code).tuplePattern()) {
        return tuplePatternToCeylon(jTuplePattern, update);
    } else {
        return null;
    }
}

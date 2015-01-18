import ceylon.ast.core {
    TuplePattern,
    UnionType,
    VariadicVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared TuplePattern tuplePatternToCeylon(JTuplePattern tuplePattern) {
    value patterns = CeylonIterable(tuplePattern.patterns).sequence();
    "Empty tuple pattern not allowed"
    assert (exists lastPattern = patterns.last);
    if (is JVariablePattern lastPattern, lastPattern.variable.type is JSequencedType) {
        // variadic
        UnionType? variadicType;
        assert (is JSequencedType jType = lastPattern.variable.type);
        if (is JValueModifier jElementType = jType.type, !jElementType.token exists) {
            // synthetic value modifier
            variadicType = null;
        } else {
            assert (is JStaticType jElementType = jType.type,
                is UnionType t = typeToCeylon(jElementType));
            variadicType = t;
        }
        value variadicElementPattern = VariadicVariable(lIdentifierToCeylon(lastPattern.variable.identifier), variadicType);
        value elementPatterns = patterns.reversed.rest.reversed.collect(patternToCeylon);
        return TuplePattern(elementPatterns, variadicElementPattern);
    } else {
        // all normal patterns
        assert (nonempty elementPatterns = patterns.collect(patternToCeylon));
        return TuplePattern(elementPatterns);
    }
}

"Compiles the given [[code]] for a Tuple Pattern
 into a [[TuplePattern]] using the Ceylon compiler
 (more specifically, the rule for a `tuplePattern`)."
shared TuplePattern? compileTuplePattern(String code) {
    if (exists jTuplePattern = createParser(code).tuplePattern()) {
        return tuplePatternToCeylon(jTuplePattern);
    } else {
        return null;
    }
}

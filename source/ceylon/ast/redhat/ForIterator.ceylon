import ceylon.ast.core {
    ForIterator,
    Pattern,
    VariablePattern,
    UnspecifiedVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForIterator=ForIterator,
        JPatternIterator=PatternIterator,
        JStaticType=StaticType,
        JValueIterator=ValueIterator
    }
}

"Converts a RedHat AST [[ForIterator|JForIterator]] to a `ceylon.ast` [[ForIterator]]."
shared ForIterator forIteratorToCeylon(JForIterator forIterator) {
    assert (is JValueIterator|JPatternIterator forIterator);
    Pattern pattern;
    switch (forIterator)
    case (is JValueIterator) {
        pattern = VariablePattern(UnspecifiedVariable(
                lIdentifierToCeylon(forIterator.variable.identifier),
                if (is JStaticType jType = forIterator.variable.type) then typeToCeylon(jType) else null));
    }
    case (is JPatternIterator) {
        pattern = patternToCeylon(forIterator.pattern);
    }
    return ForIterator(pattern, expressionToCeylon(forIterator.specifierExpression.expression));
}

"Compiles the given [[code]] for a For Iterator
 into a [[ForIterator]] using the Ceylon compiler
 (more specifically, the rule for a `forIterator`)."
shared ForIterator? compileForIterator(String code) {
    if (exists jForIterator = createParser(code).forIterator()) {
        return forIteratorToCeylon(jForIterator);
    } else {
        return null;
    }
}

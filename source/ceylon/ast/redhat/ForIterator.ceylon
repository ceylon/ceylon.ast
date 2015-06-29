import ceylon.ast.core {
    ForIterator,
    Node,
    Pattern,
    VariablePattern,
    UnspecifiedVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JForIterator=ForIterator,
        JPatternIterator=PatternIterator,
        JStaticType=StaticType,
        JValueIterator=ValueIterator
    }
}

"Converts a RedHat AST [[ForIterator|JForIterator]] to a `ceylon.ast` [[ForIterator]]."
shared ForIterator forIteratorToCeylon(JForIterator forIterator, Anything(JNode,Node) update = noop) {
    assert (is JValueIterator|JPatternIterator forIterator);
    Pattern pattern;
    switch (forIterator)
    case (is JValueIterator) {
        value variable = UnspecifiedVariable(
            lIdentifierToCeylon(forIterator.variable.identifier, update),
            if (is JStaticType jType = forIterator.variable.type) then typeToCeylon(jType, update) else null);
        update(forIterator.variable, variable);
        pattern = VariablePattern(variable);
        update(forIterator.variable, pattern);
    }
    case (is JPatternIterator) {
        pattern = patternToCeylon(forIterator.pattern, update);
    }
    value result = ForIterator(pattern, expressionToCeylon(forIterator.specifierExpression.expression, update));
    update(forIterator, result);
    return result;
}

"Compiles the given [[code]] for a For Iterator
 into a [[ForIterator]] using the Ceylon compiler
 (more specifically, the rule for a `forIterator`)."
shared ForIterator? compileForIterator(String code, Anything(JNode,Node) update = noop) {
    if (exists jForIterator = createParser(code).forIterator()) {
        return forIteratorToCeylon(jForIterator, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Node,
    SpecifiedPattern,
    Type,
    UnspecifiedVariable,
    ValueModifier,
    VariablePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDestructure=Destructure,
        JStaticType=StaticType,
        JStatement=Statement,
        JValueModifier=ValueModifier,
        JVariable=Variable
    }
}

"Converts a RedHat AST [[Statement|JStatement]],
 as produced by the rule `letVariable`,
 to a `ceylon.ast` [[SpecifiedPattern]].
 
 This is a purely internal helper function for some constructs
 that represent a pattern + specification via a [[Statement|JStatement]]:
 see [[existsOrNonemptyConditionToCeylon]] and [[letExpressionToCeylon]]."
SpecifiedPattern specifiedPatternToCeylon(JStatement statement, Anything(JNode,Node) update) {
    // letVariable
    // Either a variable or a pattern wrapped in a synthetic Destructure.
    assert (is JVariable|JDestructure jVariable = statement);
    SpecifiedPattern result;
    switch (jVariable)
    case (is JVariable) {
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier? jType = jVariable.type);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType, update); }
        case (is JValueModifier) { type = jType.mainToken exists then valueModifierToCeylon(jType, update); }
        case (null) { type = null; }
        value variable = UnspecifiedVariable(lIdentifierToCeylon(jVariable.identifier, update), type);
        update(jVariable, variable);
        value pattern = VariablePattern(variable);
        update(jVariable, pattern);
        result = SpecifiedPattern(pattern, specifierToCeylon(jVariable.specifierExpression, update));
    }
    case (is JDestructure) {
        result = SpecifiedPattern(patternToCeylon(jVariable.pattern, update), specifierToCeylon(jVariable.specifierExpression, update));
    }
    update(statement, result);
    return result;
}

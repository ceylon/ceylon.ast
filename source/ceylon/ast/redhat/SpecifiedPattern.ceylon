import ceylon.ast.core {
    SpecifiedPattern,
    Type,
    UnspecifiedVariable,
    ValueModifier,
    VariablePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
SpecifiedPattern specifiedPatternToCeylon(JStatement statement) {
    // letVariable
    // Either a variable or a pattern wrapped in a synthetic Destructure.
    assert (is JVariable|JDestructure jVariable = statement);
    switch (jVariable)
    case (is JVariable) {
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier? jType = jVariable.type);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType); }
        case (is JValueModifier) { type = jType.mainToken exists then valueModifierToCeylon(jType); }
        case (null) { type = null; }
        return SpecifiedPattern(VariablePattern(UnspecifiedVariable(lIdentifierToCeylon(jVariable.identifier), type)), specifierToCeylon(jVariable.specifierExpression));
    }
    case (is JDestructure) {
        return SpecifiedPattern(patternToCeylon(jVariable.pattern), specifierToCeylon(jVariable.specifierExpression));
    }
}

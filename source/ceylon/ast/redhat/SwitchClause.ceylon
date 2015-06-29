import ceylon.ast.core {
    Expression,
    Node,
    SpecifiedVariable,
    SwitchClause,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JStaticType=StaticType,
        JSwitchClause=SwitchClause,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[SwitchClause|JSwitchClause]] to a `ceylon.ast` [[SwitchClause]]."
shared SwitchClause switchClauseToCeylon(JSwitchClause switchClause, Anything(JNode,Node) update = noop) {
    Expression|SpecifiedVariable switched;
    if (exists jExpression = switchClause.switched.expression) {
        "Switch clause cannot have both expression and variable"
        assert (!switchClause.switched.variable exists);
        switched = expressionToCeylon(jExpression, update);
    } else {
        "Switch clause must have either expression or variable"
        assert (exists jVariable = switchClause.switched.variable);
        assert (exists jSpecifierExpression = jVariable.specifierExpression);
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier jType = jVariable.type);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType, update); }
        case (is JValueModifier) {
            if (jType.mainToken exists) {
                type = valueModifierToCeylon(jType, update);
            } else {
                // synthetic ValueModifier
                type = null;
            }
        }
        switched = SpecifiedVariable(lIdentifierToCeylon(jVariable.identifier, update), specifierToCeylon(jSpecifierExpression, update), type);
        update(jVariable, switched);
    }
    value result = SwitchClause(switched);
    update(switchClause, result);
    return result;
}

"Compiles the given [[code]] for a Switch Clause
 into a [[SwitchClause]] using the Ceylon compiler
 (more specifically, the rule for a `switchHeader`)."
shared SwitchClause? compileSwitchClause(String code, Anything(JNode,Node) update = noop) {
    if (exists jSwitchHeader = createParser(code).switchHeader()) {
        return switchClauseToCeylon(jSwitchHeader, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Expression,
    SpecifiedVariable,
    SwitchClause,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType,
        JSwitchClause=SwitchClause,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[SwitchClause|JSwitchClause]] to a `ceylon.ast` [[SwitchClause]]."
shared SwitchClause switchClauseToCeylon(JSwitchClause switchClause) {
    Expression|SpecifiedVariable switched;
    if (exists jExpression = switchClause.switched.expression) {
        "Switch clause cannot have both expression and variable"
        assert (!switchClause.switched.variable exists);
        switched = expressionToCeylon(jExpression);
    } else {
        "Switch clause must have either expression or variable"
        assert (exists jVariable = switchClause.switched.variable);
        assert (exists jSpecifierExpression = jVariable.specifierExpression);
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier jType = jVariable.type);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType); }
        case (is JValueModifier) {
            if (jType.mainToken exists) {
                type = valueModifierToCeylon(jType);
            } else {
                // synthetic ValueModifier
                type = null;
            }
        }
        switched = SpecifiedVariable(lIdentifierToCeylon(jVariable.identifier), specifierToCeylon(jSpecifierExpression), type);
    }
    return SwitchClause(switched);
}

"Compiles the given [[code]] for a Switch Clause
 into a [[SwitchClause]] using the Ceylon compiler
 (more specifically, the rule for a `switchHeader`)."
shared SwitchClause? compileSwitchClause(String code) {
    if (exists jSwitchHeader = createParser(code).switchHeader()) {
        return switchClauseToCeylon(jSwitchHeader);
    } else {
        return null;
    }
}

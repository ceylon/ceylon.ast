import ceylon.ast.core {
    ExistsCondition,
    Type,
    SpecifiedVariable,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition,
        JStaticType=StaticType,
        JSyntheticVariable=SyntheticVariable,
        JType=Type,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[ExistsCondition|JExistsCondition]] to a `ceylon.ast` [[ExistsCondition]]."
shared ExistsCondition existsConditionToCeylon(JExistsCondition existsCondition) {
    value variable = existsCondition.variable;
    JType? jType = variable.type;
    if (jType is JSyntheticVariable) {
        // impliedVariable
        return ExistsCondition(lIdentifierToCeylon(variable.identifier));
    } else {
        // specifiedVariable
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier? jType);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType); }
        case (is JValueModifier) { type = valueModifierToCeylon(jType); }
        case (null) { type = null; }
        return ExistsCondition(SpecifiedVariable(lIdentifierToCeylon(variable.identifier), specifierToCeylon(variable.specifierExpression), type));
    }
}

"Compiles the given [[code]] for an Exists Condition
 into an [[ExistsCondition]] using the Ceylon compiler
 (more specifically, the rule for an `existsCondition`)."
shared ExistsCondition? compileExistsCondition(String code) {
    if (exists jExistsCondition = createParser(code).existsCondition()) {
        return existsConditionToCeylon(jExistsCondition);
    } else {
        return null;
    }
}

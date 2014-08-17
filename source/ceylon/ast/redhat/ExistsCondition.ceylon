import ceylon.ast.core {
    ExistsCondition,
    Type,
    SpecifiedVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition,
        JStaticType=StaticType,
        JSyntheticVariable=SyntheticVariable
    }
}

"Converts a RedHat AST [[ExistsCondition|JExistsCondition]] to a `ceylon.ast` [[ExistsCondition]]."
shared ExistsCondition existsConditionToCeylon(JExistsCondition existsCondition) {
    value variable = existsCondition.variable;
    if (variable.type is JSyntheticVariable) {
        // impliedVariable
        return ExistsCondition(lIdentifierToCeylon(variable.identifier));
    } else {
        // specifiedVariable
        Type? type;
        if (exists jType = variable.type) {
            assert (is JStaticType jType);
            type = typeToCeylon(jType);
        } else {
            type = null;
        }
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

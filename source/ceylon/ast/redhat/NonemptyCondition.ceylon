import ceylon.ast.core {
    NonemptyCondition,
    SpecifiedVariable,
    Type
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonemptyCondition=NonemptyCondition,
        JStaticType=StaticType,
        JSyntheticVariable=SyntheticVariable
    }
}

"Converts a RedHat AST [[NonemptyCondition|JNonemptyCondition]] to a `ceylon.ast` [[NonemptyCondition]]."
shared NonemptyCondition nonemptyConditionToCeylon(JNonemptyCondition nonemptyCondition) {
    value variable = nonemptyCondition.variable;
    if (variable.type is JSyntheticVariable) {
        // impliedVariable
        return NonemptyCondition(lIdentifierToCeylon(variable.identifier));
    } else {
        // specifiedVariable
        Type? type;
        if (exists jType = variable.type) {
            assert (is JStaticType jType);
            type = typeToCeylon(jType);
        } else {
            type = null;
        }
        return NonemptyCondition(SpecifiedVariable(lIdentifierToCeylon(variable.identifier), specifierToCeylon(variable.specifierExpression), type));
    }
}

"Compiles the given [[code]] for a Nonempty Condition
 into a [[NonemptyCondition]] using the Ceylon compiler
 (more specifically, the rule for a `nonemptyCondition`)."
shared NonemptyCondition? compileNonemptyCondition(String code) {
    if (exists jNonemptyCondition = createParser(code).nonemptyCondition()) {
        return nonemptyConditionToCeylon(jNonemptyCondition);
    } else {
        return null;
    }
}

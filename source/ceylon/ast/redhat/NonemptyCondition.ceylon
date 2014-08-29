import ceylon.ast.core {
    NonemptyCondition,
    SpecifiedVariable,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonemptyCondition=NonemptyCondition,
        JStaticType=StaticType,
        JSyntheticVariable=SyntheticVariable,
        JType=Type,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[NonemptyCondition|JNonemptyCondition]] to a `ceylon.ast` [[NonemptyCondition]]."
shared NonemptyCondition nonemptyConditionToCeylon(JNonemptyCondition nonemptyCondition) {
    value variable = nonemptyCondition.variable;
    JType? jType = variable.type;
    if (jType is JSyntheticVariable) {
        // impliedVariable
        return NonemptyCondition(lIdentifierToCeylon(variable.identifier));
    } else {
        // specifiedVariable
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier? jType);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType); }
        case (is JValueModifier) { type = valueModifierToCeylon(jType); }
        case (null) { type = null; }
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

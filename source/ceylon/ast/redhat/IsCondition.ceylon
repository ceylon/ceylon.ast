import ceylon.ast.core {
    IsCondition,
    TypedVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsCondition=IsCondition,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[IsCondition|JIsCondition]] to a `ceylon.ast` [[IsCondition]]."
shared IsCondition isConditionToCeylon(JIsCondition isCondition) {
    assert (is JStaticType jType = isCondition.type);
    value jVariable = isCondition.variable;
    value jSpecifierExpression = jVariable.specifierExpression;
    return IsCondition {
        variable = TypedVariable {
            name = lIdentifierToCeylon(jVariable.identifier);
            type = typeToCeylon(jType);
            specifier = jSpecifierExpression.mainToken exists then specifierToCeylon(jSpecifierExpression);
        };
        negated = isCondition.not;
    };
}

"Compiles the given [[code]] for an Is Condition
 into an [[IsCondition]] using the Ceylon compiler
 (more specifically, the rule for an `isCondition`)."
shared IsCondition? compileIsCondition(String code) {
    // if (exists jIsCondition = createParser(code + ",").isCondition()) {
    // TODO use above variant when possible
    /*
     At the moment, Ceylon sees the method isCondition() as a getter
     for an attribute ‘condition’ (this is intended for boolean attributes
     (isHidden()), but apparently applied to methods of every type).
     Because there’s also a condition() method, we can’t use the
     condition “attribute” either.
     */
    if (is JIsCondition jIsCondition = createParser(code + ",").condition()) {
        // the parser needs that comma for conditions without a specifier
        return isConditionToCeylon(jIsCondition);
    } else {
        return null;
    }
}

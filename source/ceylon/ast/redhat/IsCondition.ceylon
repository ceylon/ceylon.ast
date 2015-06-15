import ceylon.ast.core {
    IsCondition,
    Node,
    TypedVariable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIsCondition=IsCondition,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[IsCondition|JIsCondition]] to a `ceylon.ast` [[IsCondition]]."
shared IsCondition isConditionToCeylon(JIsCondition isCondition, Anything(JNode,Node) update = noop) {
    assert (is JStaticType jType = isCondition.type);
    value jVariable = isCondition.variable;
    value jSpecifierExpression = jVariable.specifierExpression;
    value result = IsCondition {
        variable = TypedVariable {
            name = lIdentifierToCeylon(jVariable.identifier, update);
            type = typeToCeylon(jType, update);
            specifier = jSpecifierExpression.mainToken exists then specifierToCeylon(jSpecifierExpression, update);
        };
        negated = isCondition.not;
    };
    update(isCondition, result);
    return result;
}

"Compiles the given [[code]] for an Is Condition
 into an [[IsCondition]] using the Ceylon compiler
 (more specifically, the rule for an `isCondition`)."
shared IsCondition? compileIsCondition(String code, Anything(JNode,Node) update = noop) {
    if (exists jIsCondition = createParser(code + ",").isCondition()) {
        // the parser needs that comma for conditions without a specifier
        return isConditionToCeylon(jIsCondition, update);
    } else {
        return null;
    }
}

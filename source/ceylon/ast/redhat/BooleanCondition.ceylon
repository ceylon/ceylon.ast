import ceylon.ast.core {
    BooleanCondition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBooleanCondition=BooleanCondition
    }
}

"Converts a RedHat AST [[BooleanCondition|JBooleanCondition]] to a `ceylon.ast` [[BooleanCondition]]."
shared BooleanCondition booleanConditionToCeylon(JBooleanCondition booleanCondition, Anything(JNode,Node) update = noop) {
    value result = BooleanCondition(expressionToCeylon(booleanCondition.expression, update));
    update(booleanCondition, result);
    return result;
}

"Compiles the given [[code]] for a Boolean Condition
 into a [[BooleanCondition]] using the Ceylon compiler
 (more specifically, the rule for a `booleanCondition`)."
shared BooleanCondition? compileBooleanCondition(String code, Anything(JNode,Node) update = noop) {
    if (exists jBooleanCondition = createParser(code).booleanCondition()) {
        return booleanConditionToCeylon(jBooleanCondition, update);
    } else {
        return null;
    }
}

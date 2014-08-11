import ceylon.ast.core {
    BooleanCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBooleanCondition=BooleanCondition
    }
}

"Converts a RedHat AST [[BooleanCondition|JBooleanCondition]] to a `ceylon.ast` [[BooleanCondition]]."
shared BooleanCondition booleanConditionToCeylon(JBooleanCondition booleanCondition) {
    return BooleanCondition(expressionToCeylon(booleanCondition.expression));
}

"Compiles the given [[code]] for a Boolean Condition
 into a [[BooleanCondition]] using the Ceylon compiler
 (more specifically, the rule for a `booleanCondition`)."
shared BooleanCondition? compileBooleanCondition(String code) {
    if (exists jBooleanCondition = createParser(code).booleanCondition()) {
        return booleanConditionToCeylon(jBooleanCondition);
    } else {
        return null;
    }
}

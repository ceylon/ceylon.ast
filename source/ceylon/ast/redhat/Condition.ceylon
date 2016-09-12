import ceylon.ast.core {
    Condition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBooleanCondition=BooleanCondition,
        JCondition=Condition,
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition,
        JIsCondition=IsCondition
    }
}

"Converts a RedHat AST [[Condition|JCondition]] to a `ceylon.ast` [[Condition]]."
shared Condition conditionToCeylon(JCondition condition, Anything(JNode,Node) update = noop) {
    assert (is JBooleanCondition|JIsCondition|JExistsOrNonemptyCondition condition);
    switch (condition)
    case (is JBooleanCondition) { return booleanConditionToCeylon(condition, update); }
    case (is JIsCondition) { return isConditionToCeylon(condition, update); }
    case (is JExistsOrNonemptyCondition) { return existsOrNonemptyConditionToCeylon(condition, update); }
}

"Parses the given [[code]] for a Condition
 into a [[Condition]] using the Ceylon compiler
 (more specifically, the rule for a `condition`)."
shared Condition? parseCondition(String code, Anything(JNode,Node) update = noop) {
    if (exists jCondition = createParser(code + ",").condition()) {
        // the parser needs that comma for some conditions
        return conditionToCeylon(jCondition, update);
    } else {
        return null;
    }
}

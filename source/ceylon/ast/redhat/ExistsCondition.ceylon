import ceylon.ast.core {
    ExistsCondition,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExistsCondition=ExistsCondition
    }
}

"Converts a RedHat AST [[ExistsCondition|JExistsCondition]] to a `ceylon.ast` [[ExistsCondition]]."
shared ExistsCondition existsConditionToCeylon(JExistsCondition existsCondition, Anything(JNode, Node) update = noop) {
    assert (is ExistsCondition ret = existsOrNonemptyConditionToCeylon(existsCondition, update));
    value result = ret;
    update(existsCondition, result);
    return result;
}

"Parses the given [[code]] for an Exists Condition
 into an [[ExistsCondition]] using the Ceylon compiler
 (more specifically, the rule for an `existsCondition`)."
shared ExistsCondition? parseExistsCondition(String code, Anything(JNode, Node) update = noop) {
    if (exists jExistsCondition = createParser(code).existsCondition()) {
        return existsConditionToCeylon(jExistsCondition, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Node,
    NonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNonemptyCondition=NonemptyCondition
    }
}

"Converts a RedHat AST [[NonemptyCondition|JNonemptyCondition]] to a `ceylon.ast` [[NonemptyCondition]]."
shared NonemptyCondition nonemptyConditionToCeylon(JNonemptyCondition nonemptyCondition, Anything(JNode, Node) update = noop) {
    assert (is NonemptyCondition ret = existsOrNonemptyConditionToCeylon(nonemptyCondition, update));
    value result = ret;
    update(nonemptyCondition, result);
    return result;
}

"Parses the given [[code]] for a Nonempty Condition
 into a [[NonemptyCondition]] using the Ceylon compiler
 (more specifically, the rule for a `nonemptyCondition`)."
shared NonemptyCondition? parseNonemptyCondition(String code, Anything(JNode, Node) update = noop) {
    if (exists jNonemptyCondition = createParser(code).nonemptyCondition()) {
        return nonemptyConditionToCeylon(jNonemptyCondition, update);
    } else {
        return null;
    }
}

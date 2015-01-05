import ceylon.ast.core {
    NonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonemptyCondition=NonemptyCondition
    }
}

"Converts a RedHat AST [[NonemptyCondition|JNonemptyCondition]] to a `ceylon.ast` [[NonemptyCondition]]."
shared NonemptyCondition nonemptyConditionToCeylon(JNonemptyCondition nonemptyCondition) {
    assert (is NonemptyCondition ret = existsOrNonemptyConditionToCeylon(nonemptyCondition));
    return ret;
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

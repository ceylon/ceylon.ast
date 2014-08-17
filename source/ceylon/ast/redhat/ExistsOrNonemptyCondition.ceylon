import ceylon.ast.core {
    ExistsOrNonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition,
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition,
        JNonemptyCondition=NonemptyCondition
    }
}

"Converts a RedHat AST [[ExistsOrNonemptyCondition|JExistsOrNonemptyCondition]] to a `ceylon.ast` [[ExistsOrNonemptyCondition]]."
shared ExistsOrNonemptyCondition existsOrNonemptyConditionToCeylon(JExistsOrNonemptyCondition existsOrNonemptyCondition) {
    assert (is JExistsCondition|JNonemptyCondition existsOrNonemptyCondition);
    switch (existsOrNonemptyCondition)
    case (is JExistsCondition) { return existsConditionToCeylon(existsOrNonemptyCondition); }
    case (is JNonemptyCondition) { return nonemptyConditionToCeylon(existsOrNonemptyCondition); }
}

"Compiles the given [[code]] for an Exists Or Nonempty Condition
 into an [[ExistsOrNonemptyCondition]] using the Ceylon compiler
 (more specifically, the rule for an `condition`)."
shared ExistsOrNonemptyCondition? compileExistsOrNonemptyCondition(String code) {
    if (is JExistsOrNonemptyCondition jCondition = createParser(code).condition()) {
        return existsOrNonemptyConditionToCeylon(jCondition);
    } else {
        return null;
    }
}

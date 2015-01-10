import ceylon.ast.core {
    ExistsCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition
    }
}

"Converts a RedHat AST [[ExistsCondition|JExistsCondition]] to a `ceylon.ast` [[ExistsCondition]]."
shared ExistsCondition existsConditionToCeylon(JExistsCondition existsCondition) {
    assert (is ExistsCondition ret = existsOrNonemptyConditionToCeylon(existsCondition));
    return ret;
}

"Compiles the given [[code]] for an Exists Condition
 into an [[ExistsCondition]] using the Ceylon compiler
 (more specifically, the rule for an `existsCondition`)."
shared ExistsCondition? compileExistsCondition(String code) {
    if (exists jExistsCondition = createParser(code).existsCondition()) {
        return existsConditionToCeylon(jExistsCondition);
    } else {
        return null;
    }
}

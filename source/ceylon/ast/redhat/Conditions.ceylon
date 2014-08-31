import ceylon.ast.core {
    Conditions
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConditionList=ConditionList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ConditionList|JConditionList]] to `ceylon.ast` [[Conditions]]."
shared Conditions conditionsToCeylon(JConditionList conditions) {
    assert (nonempty conds = CeylonIterable(conditions.conditions).collect(conditionToCeylon));
    return Conditions(conds);
}

"Compiles the given [[code]] for Conditions
 into [[Conditions]] using the Ceylon compiler
 (more specifically, the rule for `conditions`)."
shared Conditions? compileConditions(String code) {
    if (exists jConditions = createParser(code).conditions()) {
        return conditionsToCeylon(jConditions);
    } else {
        return null;
    }
}

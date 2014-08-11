import ceylon.ast.core {
    ConditionList
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConditionList=ConditionList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ConditionList|JConditionList]] to a `ceylon.ast` [[ConditionList]]."
shared ConditionList conditionListToCeylon(JConditionList conditionList) {
    assert (nonempty conditions = CeylonIterable(conditionList.conditions).collect(conditionToCeylon));
    return ConditionList(conditions);
}

"Compiles the given [[code]] for a Condition List
 into a [[ConditionList]] using the Ceylon compiler
 (more specifically, the rule for `conditions`)."
shared ConditionList? compileConditionList(String code) {
    if (exists jConditions = createParser(code).conditions()) {
        return conditionListToCeylon(jConditions);
    } else {
        return null;
    }
}

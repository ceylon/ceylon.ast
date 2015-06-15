import ceylon.ast.core {
    Conditions,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JConditionList=ConditionList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ConditionList|JConditionList]] to `ceylon.ast` [[Conditions]]."
shared Conditions conditionsToCeylon(JConditionList conditions, Anything(JNode,Node) update = noop) {
    assert (nonempty conds = CeylonIterable(conditions.conditions).collect(propagateUpdate(conditionToCeylon, update)));
    value result = Conditions(conds);
    update(conditions, result);
    return result;
}

"Compiles the given [[code]] for Conditions
 into [[Conditions]] using the Ceylon compiler
 (more specifically, the rule for `conditions`)."
shared Conditions? compileConditions(String code, Anything(JNode,Node) update = noop) {
    if (exists jConditions = createParser(code).conditions()) {
        return conditionsToCeylon(jConditions, update);
    } else {
        return null;
    }
}

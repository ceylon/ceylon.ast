import ceylon.ast.core {
    ExistsCondition,
    ExistsOrNonemptyCondition,
    LIdentifier,
    Node,
    NonemptyCondition,
    SpecifiedPattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExistsCondition=ExistsCondition,
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition,
        JNonemptyCondition=NonemptyCondition,
        JSyntheticVariable=SyntheticVariable,
        JVariable=Variable
    }
}

"Converts a RedHat AST [[ExistsOrNonemptyCondition|JExistsOrNonemptyCondition]] to a `ceylon.ast` [[ExistsOrNonemptyCondition]]."
shared ExistsOrNonemptyCondition existsOrNonemptyConditionToCeylon(JExistsOrNonemptyCondition existsOrNonemptyCondition, Anything(JNode,Node) update = noop) {
    /*
     The conversion is almost identical for both kinds of condition,
     so we do it here instead of delegating to {exists,nonempty}ConditionToCeylon by typecast.
     */
    SpecifiedPattern|LIdentifier tested;
    if (is JVariable jVariable = existsOrNonemptyCondition.variable, jVariable.type is JSyntheticVariable) {
        // impliedVariable
        // The parser adds lots of synthetic stuff to these, even a specifier expression. Ignore all that.
        tested = lIdentifierToCeylon(jVariable.identifier, update);
    } else {
        // letVariable
        // Either a variable or a pattern wrapped in a synthetic Destructure.
        tested = specifiedPatternToCeylon(existsOrNonemptyCondition.variable, update);
    }
    ExistsOrNonemptyCondition result;
    switch (existsOrNonemptyCondition)
    case (is JExistsCondition) { result = ExistsCondition(tested, existsOrNonemptyCondition.not); }
    case (is JNonemptyCondition) { result = NonemptyCondition(tested, existsOrNonemptyCondition.not); }
    else { throw AssertionError("Unknown kind of EXistsOrNonemptyCondition"); }
    update(existsOrNonemptyCondition, result);
    return result;
}

"Parses the given [[code]] for an Exists Or Nonempty Condition
 into an [[ExistsOrNonemptyCondition]] using the Ceylon compiler
 (more specifically, the rule for an `condition`)."
shared ExistsOrNonemptyCondition? parseExistsOrNonemptyCondition(String code, Anything(JNode,Node) update = noop) {
    if (is JExistsOrNonemptyCondition jCondition = createParser(code).condition()) {
        return existsOrNonemptyConditionToCeylon(jCondition, update);
    } else {
        return null;
    }
}

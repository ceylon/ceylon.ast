import ceylon.ast.core {
    ExistsCondition,
    ExistsOrNonemptyCondition,
    LIdentifier,
    NonemptyCondition,
    SpecifiedPattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition,
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition,
        JNonemptyCondition=NonemptyCondition,
        JSyntheticVariable=SyntheticVariable,
        JVariable=Variable
    }
}

"Converts a RedHat AST [[ExistsOrNonemptyCondition|JExistsOrNonemptyCondition]] to a `ceylon.ast` [[ExistsOrNonemptyCondition]]."
shared ExistsOrNonemptyCondition existsOrNonemptyConditionToCeylon(JExistsOrNonemptyCondition existsOrNonemptyCondition) {
    /*
     The conversion is almost identical for both kinds of condition,
     so we do it here instead of delegating to {exists,nonempty}ConditionToCeylon by typecast.
     */
    SpecifiedPattern|LIdentifier tested;
    if (is JVariable jVariable = existsOrNonemptyCondition.variable, jVariable.type is JSyntheticVariable) {
        // impliedVariable
        // The parser adds lots of synthetic stuff to these, even a specifier expression. Ignore all that.
        tested = lIdentifierToCeylon(jVariable.identifier);
    } else {
        // letVariable
        // Either a variable or a pattern wrapped in a synthetic Destructure.
        tested = specifiedPatternToCeylon(existsOrNonemptyCondition.variable);
    }
    switch (existsOrNonemptyCondition)
    case (is JExistsCondition) { return ExistsCondition(tested); }
    case (is JNonemptyCondition) { return NonemptyCondition(tested); }
    else { throw AssertionError("Unknown kind of EXistsOrNonemptyCondition"); }
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

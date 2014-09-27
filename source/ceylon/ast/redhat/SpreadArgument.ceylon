import ceylon.ast.core {
    UnioningExpression,
    SpreadArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadArgument=SpreadArgument
    }
}

"Converts a RedHat AST [[SpreadArgument|JSpreadArgument]] to a `ceylon.ast` [[SpreadArgument]]."
shared SpreadArgument spreadArgumentToCeylon(JSpreadArgument spreadArgument) {
    "Check precedence"
    assert (is UnioningExpression expression = expressionToCeylon(spreadArgument.expression));
    return SpreadArgument(expression);
}

"Compiles the given [[code]] for a Spread Argument
 into a [[SpreadArgument]] using the Ceylon compiler
 (more specifically, the rule for a `spreadArgument`)."
shared SpreadArgument? compileSpreadArgument(String code) {
    if (exists jSpreadArgument = createParser(code).spreadArgument()) {
        return spreadArgumentToCeylon(jSpreadArgument);
    } else {
        return null;
    }
}

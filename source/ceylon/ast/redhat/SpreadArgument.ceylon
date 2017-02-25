import ceylon.ast.core {
    Node,
    UnioningExpression,
    SpreadArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSpreadArgument=SpreadArgument
    }
}

"Converts a RedHat AST [[SpreadArgument|JSpreadArgument]] to a `ceylon.ast` [[SpreadArgument]]."
shared SpreadArgument spreadArgumentToCeylon(JSpreadArgument spreadArgument, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is UnioningExpression expression = expressionToCeylon(spreadArgument.expression, update));
    value result = SpreadArgument(expression);
    update(spreadArgument, result);
    return result;
}

"Parses the given [[code]] for a Spread Argument
 into a [[SpreadArgument]] using the Ceylon compiler
 (more specifically, the rule for a `spreadArgument`)."
shared SpreadArgument? parseSpreadArgument(String code, Anything(JNode, Node) update = noop) {
    if (exists jSpreadArgument = createParser(code).spreadArgument()) {
        return spreadArgumentToCeylon(jSpreadArgument, update);
    } else {
        return null;
    }
}

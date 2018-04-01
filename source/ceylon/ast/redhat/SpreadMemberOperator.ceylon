import ceylon.ast.core {
    Node,
    SpreadMemberOperator
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSpreadOp=SpreadOp
    }
}

"Converts a RedHat AST [[SpreadOp|JSpreadOp]] to a `ceylon.ast` [[SpreadMemberOperator]]."
shared SpreadMemberOperator spreadMemberOperatorToCeylon(JSpreadOp spreadMemberOperator, Anything(JNode, Node) update = noop) {
    value result = SpreadMemberOperator();
    update(spreadMemberOperator, result);
    return result;
}

"Parses the given [[code]] for a Spread Member Operator
 into a [[SpreadMemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared SpreadMemberOperator? parseSpreadMemberOperator(String code, Anything(JNode, Node) update = noop) {
    if (is JSpreadOp jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return spreadMemberOperatorToCeylon(jMemberSelectionOperator, update);
    } else {
        return null;
    }
}

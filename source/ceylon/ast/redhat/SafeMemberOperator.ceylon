import ceylon.ast.core {
    Node,
    SafeMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSafeMemberOp=SafeMemberOp
    }
}

"Converts a RedHat AST [[SafeMemberOp|JSafeMemberOp]] to a `ceylon.ast` [[SafeMemberOperator]]."
shared SafeMemberOperator safeMemberOperatorToCeylon(JSafeMemberOp safeMemberOperator, Anything(JNode,Node) update = noop) {
    value result = SafeMemberOperator();
    update(safeMemberOperator, result);
    return result;
}

"Compiles the given [[code]] for a Safe Member Operator
 into a [[SafeMemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared SafeMemberOperator? compileSafeMemberOperator(String code, Anything(JNode,Node) update = noop) {
    if (is JSafeMemberOp jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return safeMemberOperatorToCeylon(jMemberSelectionOperator, update);
    } else {
        return null;
    }
}

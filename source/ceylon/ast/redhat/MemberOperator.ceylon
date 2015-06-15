import ceylon.ast.core {
    MemberOperator,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JMemberOp=MemberOp
    }
}

"Converts a RedHat AST [[MemberOp|JMemberOp]] to a `ceylon.ast` [[MemberOperator]]."
shared MemberOperator memberOperatorToCeylon(JMemberOp memberOperator, Anything(JNode,Node) update = noop) {
    value result = MemberOperator();
    update(memberOperator, result);
    return result;
}

"Compiles the given [[code]] for a Member Operator
 into a [[MemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared MemberOperator? compileMemberOperator(String code, Anything(JNode,Node) update = noop) {
    if (is JMemberOp jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return memberOperatorToCeylon(jMemberSelectionOperator, update);
    } else {
        return null;
    }
}

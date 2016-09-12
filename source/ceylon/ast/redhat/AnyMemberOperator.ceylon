import ceylon.ast.core {
    AnyMemberOperator,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JMemberOp=MemberOp,
        JMemberOperator=MemberOperator,
        JSafeMemberOp=SafeMemberOp,
        JSpreadOp=SpreadOp
    }
}

"Converts a RedHat AST [[MemberOperator|JMemberOperator]] to a `ceylon.ast` [[AnyMemberOperator]]."
shared AnyMemberOperator anyMemberOperatorToCeylon(JMemberOperator anyMemberOperator, Anything(JNode,Node) update = noop) {
    assert (is JMemberOp|JSafeMemberOp|JSpreadOp anyMemberOperator);
    switch (anyMemberOperator)
    case (is JMemberOp) { return memberOperatorToCeylon(anyMemberOperator, update); }
    case (is JSafeMemberOp) { return safeMemberOperatorToCeylon(anyMemberOperator, update); }
    case (is JSpreadOp) { return spreadMemberOperatorToCeylon(anyMemberOperator, update); }
}

"Parses the given [[code]] for Any Member Operator
 into an [[AnyMemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared AnyMemberOperator? parseAnyMemberOperator(String code, Anything(JNode,Node) update = noop) {
    if (exists jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return anyMemberOperatorToCeylon(jMemberSelectionOperator, update);
    } else {
        return null;
    }
}

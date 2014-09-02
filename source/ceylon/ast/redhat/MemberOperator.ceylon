import ceylon.ast.core {
    MemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberOp=MemberOp
    }
}

"Converts a RedHat AST [[MemberOp|JMemberOp]] to a `ceylon.ast` [[MemberOperator]]."
shared MemberOperator memberOperatorToCeylon(JMemberOp memberOperator)
        => MemberOperator();

"Compiles the given [[code]] for a Member Operator
 into a [[MemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared MemberOperator? compileMemberOperator(String code) {
    if (is JMemberOp jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return memberOperatorToCeylon(jMemberSelectionOperator);
    } else {
        return null;
    }
}

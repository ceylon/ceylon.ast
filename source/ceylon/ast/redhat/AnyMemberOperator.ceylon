import ceylon.ast.core {
    AnyMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberOp=MemberOp,
        JMemberOperator=MemberOperator,
        JSafeMemberOp=SafeMemberOp,
        JSpreadOp=SpreadOp
    }
}

"Converts a RedHat AST [[MemberOperator|JMemberOperator]] to a `ceylon.ast` [[AnyMemberOperator]]."
shared AnyMemberOperator anyMemberOperatorToCeylon(JMemberOperator anyMemberOperator) {
    assert (is JMemberOp|JSafeMemberOp|JSpreadOp anyMemberOperator);
    switch (anyMemberOperator)
    case (is JMemberOp) { return memberOperatorToCeylon(anyMemberOperator); }
    case (is JSafeMemberOp) { return safeMemberOperatorToCeylon(anyMemberOperator); }
    case (is JSpreadOp) { return spreadMemberOperatorToCeylon(anyMemberOperator); }
}

"Compiles the given [[code]] for Any Member Operator
 into an [[AnyMemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared AnyMemberOperator? compileAnyMemberOperator(String code) {
    if (exists jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return anyMemberOperatorToCeylon(jMemberSelectionOperator);
    } else {
        return null;
    }
}

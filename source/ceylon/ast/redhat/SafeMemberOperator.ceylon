import ceylon.ast.core {
    SafeMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSafeMemberOp=SafeMemberOp
    }
}

"Converts a RedHat AST [[SafeMemberOp|JSafeMemberOp]] to a `ceylon.ast` [[SafeMemberOperator]]."
shared SafeMemberOperator safeMemberOperatorToCeylon(JSafeMemberOp safeMemberOperator)
        => SafeMemberOperator();

"Compiles the given [[code]] for a Safe Member Operator
 into a [[SafeMemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared SafeMemberOperator? compileSafeMemberOperator(String code) {
    if (is JSafeMemberOp jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return safeMemberOperatorToCeylon(jMemberSelectionOperator);
    } else {
        return null;
    }
}

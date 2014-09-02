import ceylon.ast.core {
    SpreadMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadOp=SpreadOp
    }
}

"Converts a RedHat AST [[SpreadOp|JSpreadOp]] to a `ceylon.ast` [[SpreadMemberOperator]]."
shared SpreadMemberOperator spreadMemberOperatorToCeylon(JSpreadOp spreadMemberOperator)
        => SpreadMemberOperator();

"Compiles the given [[code]] for a Spread Member Operator
 into a [[SpreadMemberOperator]] using the Ceylon compiler
 (more specifically, the rule for a `memberSelectionOperator`)."
shared SpreadMemberOperator? compileSpreadMemberOperator(String code) {
    if (is JSpreadOp jMemberSelectionOperator = createParser(code).memberSelectionOperator()) {
        return spreadMemberOperatorToCeylon(jMemberSelectionOperator);
    } else {
        return null;
    }
}

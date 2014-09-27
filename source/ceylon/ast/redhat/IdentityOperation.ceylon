import ceylon.ast.core {
    IdentityOperation,
    ExponentiatingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPositiveOp=PositiveOp
    }
}

"Converts a RedHat AST [[PositiveOp|JPositiveOp]] to a `ceylon.ast` [[IdentityOperation]]."
shared IdentityOperation identityOperationToCeylon(JPositiveOp identityOperation) {
    assert (is ExponentiatingExpression operand = expressionToCeylon(identityOperation.term));
    return IdentityOperation(operand);
}

"Compiles the given [[code]] for an Identity Operation
 into an [[IdentityOperation]] using the Ceylon compiler
 (more specifically, the rule for an `negationComplementExpression`)."
shared IdentityOperation? compileIdentityOperation(String code) {
    if (is JPositiveOp jNegationComplementExpression = createParser(code).negationComplementExpression()) {
        return identityOperationToCeylon(jNegationComplementExpression);
    } else {
        return null;
    }
}

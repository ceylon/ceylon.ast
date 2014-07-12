import ceylon.ast.core {
    UnaryArithmeticOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNegativeOp=NegativeOp,
        JPositiveOp=PositiveOp
    }
}

"Converts a RedHat AST [[NegativeOp|JNegativeOp]] or [[PositiveOp|JPositiveOp]] to a `ceylon.ast` [[UnaryArithmeticOperation]]."
shared UnaryArithmeticOperation unaryArithmeticOperationToCeylon(JNegativeOp|JPositiveOp unaryArithmeticOperation) {
    switch (unaryArithmeticOperation)
    case (is JNegativeOp) { return negationOperationToCeylon(unaryArithmeticOperation); }
    case (is JPositiveOp) { return identityOperationToCeylon(unaryArithmeticOperation); }
}

"Compiles the given [[code]] for an Unary Arithmetic Operation
 into an [[UnaryArithmeticOperation]] using the Ceylon compiler
 (more specifically, the rule for an `negationComplementExpression`)."
shared UnaryArithmeticOperation? compileUnaryArithmeticOperation(String code) {
    if (exists jNegationComplementExpression = createParser(code).negationComplementExpression()) {
        assert (is JNegativeOp|JPositiveOp jNegationComplementExpression);
        return unaryArithmeticOperationToCeylon(jNegationComplementExpression);
    } else {
        return null;
    }
}

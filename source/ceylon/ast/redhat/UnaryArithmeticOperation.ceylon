import ceylon.ast.core {
    Node,
    UnaryArithmeticOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNegativeOp=NegativeOp,
        JPositiveOp=PositiveOp
    }
}

"Converts a RedHat AST [[NegativeOp|JNegativeOp]] or [[PositiveOp|JPositiveOp]] to a `ceylon.ast` [[UnaryArithmeticOperation]]."
shared UnaryArithmeticOperation unaryArithmeticOperationToCeylon(JNegativeOp|JPositiveOp unaryArithmeticOperation, Anything(JNode,Node) update = noop) {
    switch (unaryArithmeticOperation)
    case (is JNegativeOp) { return negationOperationToCeylon(unaryArithmeticOperation, update); }
    case (is JPositiveOp) { return identityOperationToCeylon(unaryArithmeticOperation, update); }
}

"Compiles the given [[code]] for an Unary Arithmetic Operation
 into an [[UnaryArithmeticOperation]] using the Ceylon compiler
 (more specifically, the rule for an `negationComplementExpression`)."
shared UnaryArithmeticOperation? compileUnaryArithmeticOperation(String code, Anything(JNode,Node) update = noop) {
    if (exists jNegationComplementExpression = createParser(code).negationComplementExpression()) {
        assert (is JNegativeOp|JPositiveOp jNegationComplementExpression);
        return unaryArithmeticOperationToCeylon(jNegationComplementExpression, update);
    } else {
        return null;
    }
}

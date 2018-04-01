import ceylon.ast.core {
    ArithmeticOperation,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JArithmeticOp=ArithmeticOp,
        JDifferenceOp=DifferenceOp,
        JPowerOp=PowerOp,
        JProductOp=ProductOp,
        JQuotientOp=QuotientOp,
        JRemainderOp=RemainderOp,
        JSumOp=SumOp
    }
}

"Converts a RedHat AST [[ArithmeticOp|JArithmeticOp]] to a `ceylon.ast` [[ArithmeticOperation]]."
shared ArithmeticOperation arithmeticOperationToCeylon(JArithmeticOp arithmeticOperation, Anything(JNode, Node) update = noop) {
    assert (is JPowerOp|JProductOp|JQuotientOp|JRemainderOp|JSumOp|JDifferenceOp arithmeticOperation);
    switch (arithmeticOperation)
    case (is JPowerOp) { return exponentiationOperationToCeylon(arithmeticOperation, update); }
    case (is JProductOp) { return productOperationToCeylon(arithmeticOperation, update); }
    case (is JQuotientOp) { return quotientOperationToCeylon(arithmeticOperation, update); }
    case (is JRemainderOp) { return remainderOperationToCeylon(arithmeticOperation, update); }
    case (is JSumOp) { return sumOperationToCeylon(arithmeticOperation, update); }
    case (is JDifferenceOp) { return differenceOperationToCeylon(arithmeticOperation, update); }
}

"Parses the given [[code]] for an Arithmetic Operation
 into an [[ArithmeticOperation]] using the Ceylon compiler
 (more specifically, the rule for an `additiveExpression`)."
shared ArithmeticOperation? parseArithmeticOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JArithmeticOp jArithmeticOp = createParser(code).additiveExpression()) {
        return arithmeticOperationToCeylon(jArithmeticOp, update);
    } else {
        return null;
    }
}

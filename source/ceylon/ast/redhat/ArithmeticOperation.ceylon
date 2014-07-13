import ceylon.ast.core {
    ArithmeticOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared ArithmeticOperation arithmeticOperationToCeylon(JArithmeticOp arithmeticOperation) {
    assert (is JPowerOp|JProductOp|JQuotientOp|JRemainderOp|JSumOp|JDifferenceOp arithmeticOperation);
    switch (arithmeticOperation)
    case (is JPowerOp) { return exponentiationOperationToCeylon(arithmeticOperation); }
    case (is JProductOp) { return productOperationToCeylon(arithmeticOperation); }
    case (is JQuotientOp) { return quotientOperationToCeylon(arithmeticOperation); }
    case (is JRemainderOp) { return remainderOperationToCeylon(arithmeticOperation); }
    case (is JSumOp) { return sumOperationToCeylon(arithmeticOperation); }
    case (is JDifferenceOp) { return differenceOperationToCeylon(arithmeticOperation); }
}

"Compiles the given [[code]] for an Arithmetic Operation
 into an [[ArithmeticOperation]] using the Ceylon compiler
 (more specifically, the rule for an `additiveExpression`)."
shared ArithmeticOperation? compileArithmeticOperation(String code) {
    if (is JArithmeticOp jArithmeticOp = createParser(code).additiveExpression()) {
        return arithmeticOperationToCeylon(jArithmeticOp);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ExponentiationOperation,
    Precedence1Expression,
    Precedence2Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPowerOp=PowerOp
    }
}

"Converts a RedHat AST [[PowerOp|JPowerOp]] to a `ceylon.ast` [[ExponentiationOperation]]."
shared ExponentiationOperation exponentiationOperationToCeylon(JPowerOp exponentiationExpression) {
    assert (is Precedence1Expression left = expressionToCeylon(exponentiationExpression.leftTerm));
    assert (is Precedence2Expression right = expressionToCeylon(exponentiationExpression.rightTerm));
    return ExponentiationOperation(left, right);
}

"Compiles the given [[code]] for an Exponentiation Operation
 into an [[ExponentiationOperation]] using the Ceylon compiler
 (more specifically, the rule for an `exponentiationExpression`)."
shared ExponentiationOperation? compileExponentiationOperation(String code) {
    if (is JPowerOp jExponentiationExpression = createParser(code).exponentiationExpression()) {
        return exponentiationOperationToCeylon(jExponentiationExpression);
    } else {
        return null;
    }
}

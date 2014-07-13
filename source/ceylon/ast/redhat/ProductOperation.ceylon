import ceylon.ast.core {
    Precedence5Expression,
    Precedence6Expression,
    ProductOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JProductOp=ProductOp
    }
}

"Converts a RedHat AST [[ProductOp|JProductOp]] to a `ceylon.ast` [[ProductOperation]]."
shared ProductOperation productOperationToCeylon(JProductOp productOperation) {
    "Check precedence"
    assert (is Precedence6Expression left = expressionToCeylon(productOperation.leftTerm),
        is Precedence5Expression right = expressionToCeylon(productOperation.rightTerm));
    return ProductOperation(left, right);
}

"Compiles the given [[code]] for a Product Operation
 into a [[ProductOperation]] using the Ceylon compiler
 (more specifically, the rule for a `multiplicativeExpression`)."
shared ProductOperation? compileProductOperation(String code) {
    if (is JProductOp jMultiplicativeExpression = createParser(code).multiplicativeExpression()) {
        return productOperationToCeylon(jMultiplicativeExpression);
    } else {
        return null;
    }
}

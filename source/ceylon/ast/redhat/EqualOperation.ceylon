import ceylon.ast.core {
    EqualOperation,
    ComparingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEqualOp=EqualOp
    }
}

"Converts a RedHat AST [[EqualOp|JEqualOp]] to a `ceylon.ast` [[EqualOperation]]."
shared EqualOperation equalOperationToCeylon(JEqualOp equalOperation) {
    "Check precedence"
    assert (is ComparingExpression left = expressionToCeylon(equalOperation.leftTerm),
        is ComparingExpression right = expressionToCeylon(equalOperation.rightTerm));
    return EqualOperation(left, right);
}

"Compiles the given [[code]] for an Equal Operation
 into an [[EqualOperation]] using the Ceylon compiler
 (more specifically, the rule for an `equalityExpression`)."
shared EqualOperation? compileEqualOperation(String code) {
    if (is JEqualOp jEqualityExpression = createParser(code).equalityExpression()) {
        return equalOperationToCeylon(jEqualityExpression);
    } else {
        return null;
    }
}

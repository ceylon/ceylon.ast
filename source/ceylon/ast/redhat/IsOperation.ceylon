import ceylon.ast.core {
    IsOperation,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsOp=IsOp,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[IsOp|JIsOp]] to a `ceylon.ast` [[IsOperation]]."
shared IsOperation isOperationToCeylon(JIsOp isOperation) {
    "Check precedence"
    assert (is Precedence10Expression operand = expressionToCeylon(isOperation.term));
    "Must be a real type"
    assert (is JStaticType type = isOperation.type);
    return IsOperation(operand, typeToCeylon(type));
}

"Compiles the given [[code]] for an Is Operation
 into an [[IsOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared IsOperation? compileIsOperation(String code) {
    if (is JIsOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return isOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}

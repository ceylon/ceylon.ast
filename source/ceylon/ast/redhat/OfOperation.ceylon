import ceylon.ast.core {
    OfOperation,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOfOp=OfOp,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[OfOp|JOfOp]] to a `ceylon.ast` [[OfOperation]]."
shared OfOperation ofOperationToCeylon(JOfOp ofOperation) {
    "Check precedence"
    assert (is Precedence10Expression operand = expressionToCeylon(ofOperation.term));
    "Must be a real type"
    assert (is JStaticType type = ofOperation.type);
    return OfOperation(operand, typeToCeylon(type));
}

"Compiles the given [[code]] for an Of Operation
 into an [[OfOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared OfOperation? compileOfOperation(String code) {
    if (is JOfOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return ofOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}

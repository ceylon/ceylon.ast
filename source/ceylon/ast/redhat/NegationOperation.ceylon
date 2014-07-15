import ceylon.ast.core {
    NegationOperation,
    Precedence2Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNegativeOp=NegativeOp
    }
}

"Converts a RedHat AST [[NegativeOp|JNegativeOp]] to a `ceylon.ast` [[NegationOperation]]."
shared NegationOperation negationOperationToCeylon(JNegativeOp negationOperation) {
    assert (is Precedence2Expression operand = expressionToCeylon(negationOperation.term));
    return NegationOperation(operand);
}

"Compiles the given [[code]] for a Negation Operation
 into a [[NegationOperation]] using the Ceylon compiler
 (more specifically, the rule for a `negationComplementExpression`)."
shared NegationOperation? compileNegationOperation(String code) {
    if (is JNegativeOp jNegationComplementExpression = createParser(code).negationComplementExpression()) {
        return negationOperationToCeylon(jNegationComplementExpression);
    } else {
        return null;
    }
}

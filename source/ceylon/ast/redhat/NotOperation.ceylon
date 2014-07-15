import ceylon.ast.core {
    NotOperation,
    Precedence13Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNotOp=NotOp
    }
}

"Converts a RedHat AST [[NotOp|JNotOp]] to a `ceylon.ast` [[NotOperation]]."
shared NotOperation notOperationToCeylon(JNotOp notOperation) {
    "Check precedence"
    assert (is Precedence13Expression operand = expressionToCeylon(notOperation.term));
    return NotOperation(operand);
}

"Compiles the given [[code]] for a Not Operation
 into a [[NotOperation]] using the Ceylon compiler
 (more specifically, the rule for a `logicalNegationExpression`)."
shared NotOperation? compileNotOperation(String code) {
    if (is JNotOp jLogicalNegationExpression = createParser(code).logicalNegationExpression()) {
        return notOperationToCeylon(jLogicalNegationExpression);
    } else {
        return null;
    }
}

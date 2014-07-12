import ceylon.ast.core {
    PrefixOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDecrementOp=DecrementOp,
        JIncrementOp=IncrementOp,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[PrefixOperatorExpression|JPrefixOperatorExpression]] to a `ceylon.ast` [[PrefixOperation]]."
shared PrefixOperation prefixOperationToCeylon(JPrefixOperatorExpression prefixOperation) {
    assert (is JDecrementOp|JIncrementOp prefixOperation);
    switch (prefixOperation)
    case (is JIncrementOp) { return prefixIncrementOperationToCeylon(prefixOperation); }
    case (is JDecrementOp) { return prefixDecrementOperationToCeylon(prefixOperation); }
}

"Compiles the given [[code]] for a Prefix Operation
 into a [[PrefixOperation]] using the Ceylon compiler
 (more specifically, the rule for an `incrementDecrementExpression`)."
shared PrefixOperation? compilePrefixOperation(String code) {
    if (is JPrefixOperatorExpression jPrefixOperation = createParser(code).incrementDecrementExpression(),
        !jPrefixOperation.term is JPrefixOperatorExpression && !jPrefixOperation.term is JPostfixOperatorExpression) {
        return prefixOperationToCeylon(jPrefixOperation);
    } else {
        return null;
    }
}

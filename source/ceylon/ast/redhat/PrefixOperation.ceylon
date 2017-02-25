import ceylon.ast.core {
    Node,
    PrefixOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDecrementOp=DecrementOp,
        JIncrementOp=IncrementOp,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[PrefixOperatorExpression|JPrefixOperatorExpression]] to a `ceylon.ast` [[PrefixOperation]]."
shared PrefixOperation prefixOperationToCeylon(JPrefixOperatorExpression prefixOperation, Anything(JNode, Node) update = noop) {
    assert (is JDecrementOp|JIncrementOp prefixOperation);
    switch (prefixOperation)
    case (is JIncrementOp) { return prefixIncrementOperationToCeylon(prefixOperation, update); }
    case (is JDecrementOp) { return prefixDecrementOperationToCeylon(prefixOperation, update); }
}

"Parses the given [[code]] for a Prefix Operation
 into a [[PrefixOperation]] using the Ceylon compiler
 (more specifically, the rule for an `incrementDecrementExpression`)."
shared PrefixOperation? parsePrefixOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JPrefixOperatorExpression jPrefixOperation = createParser(code).incrementDecrementExpression(),
        !jPrefixOperation.term is JPrefixOperatorExpression && !jPrefixOperation.term is JPostfixOperatorExpression) {
        return prefixOperationToCeylon(jPrefixOperation, update);
    } else {
        return null;
    }
}

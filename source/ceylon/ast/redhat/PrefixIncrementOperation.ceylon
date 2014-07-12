import ceylon.ast.core {
    PrefixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIncrementOp=IncrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[IncrementOp|JIncrementOp]] to a `ceylon.ast` [[PrefixIncrementOperation]]."
shared PrefixIncrementOperation prefixIncrementOperationToCeylon(JIncrementOp prefixIncrementOperation) {
    assert (is JPrimary jPrimary = prefixIncrementOperation.term);
    return PrefixIncrementOperation(primaryToCeylon(jPrimary));
}

"Compiles the given [[code]] for a Prefix Increment Operation
 into a [[PrefixIncrementOperation]] using the Ceylon compiler
 (more specifically, the rule for an `incrementDecrementExpression`)."
shared PrefixIncrementOperation? compilePrefixIncrementOperation(String code) {
    if (is JIncrementOp jPrefixIncrementOperation = createParser(code).incrementDecrementExpression(),
        jPrefixIncrementOperation.term is JPrimary) {
        return prefixIncrementOperationToCeylon(jPrefixIncrementOperation);
    } else {
        return null;
    }
}

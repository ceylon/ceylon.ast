import ceylon.ast.core {
    PrefixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDecrementOp=DecrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[DecrementOp|JDecrementOp]] to a `ceylon.ast` [[PrefixDecrementOperation]]."
shared PrefixDecrementOperation prefixDecrementOperationToCeylon(JDecrementOp prefixDecrementOperation) {
    assert (is JPrimary jPrimary = prefixDecrementOperation.term);
    return PrefixDecrementOperation(primaryToCeylon(jPrimary));
}

"Compiles the given [[code]] for a Prefix Decrement Operation
 into a [[PrefixDecrementOperation]] using the Ceylon compiler
 (more specifically, the rule for n `incrementDecrementExpression`)."
shared PrefixDecrementOperation? compilePrefixDecrementOperation(String code) {
    if (is JDecrementOp jDecrementOp = createParser(code).incrementDecrementExpression(),
        jDecrementOp.term is JPrimary) {
        return prefixDecrementOperationToCeylon(jDecrementOp);
    } else {
        return null;
    }
}

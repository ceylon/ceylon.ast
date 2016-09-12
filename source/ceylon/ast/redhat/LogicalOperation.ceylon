import ceylon.ast.core {
    LogicalOperation,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAndOp=AndOp,
        JLogicalOp=LogicalOp,
        JOrOp=OrOp
    }
}

"Converts a RedHat AST [[LogicalOp|JLogicalOp]] to a `ceylon.ast` [[LogicalOperation]]."
shared LogicalOperation logicalOperationToCeylon(JLogicalOp logicalOperation, Anything(JNode,Node) update = noop) {
    assert (is JAndOp|JOrOp logicalOperation);
    switch (logicalOperation)
    case (is JAndOp) { return andOperationToCeylon(logicalOperation, update); }
    case (is JOrOp) { return orOperationToCeylon(logicalOperation, update); }
}

"Parses the given [[code]] for a Logical Operation
 into a [[LogicalOperation]] using the Ceylon compiler
 (more specifically, the rule for a `disjunctionExpression`)."
shared LogicalOperation? parseLogicalOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JLogicalOp jDisjunctionExpression = createParser(code).disjunctionExpression()) {
        return logicalOperationToCeylon(jDisjunctionExpression, update);
    } else {
        return null;
    }
}

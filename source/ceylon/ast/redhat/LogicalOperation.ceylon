import ceylon.ast.core {
    LogicalOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAndOp=AndOp,
        JLogicalOp=LogicalOp,
        JOrOp=OrOp
    }
}

"Converts a RedHat AST [[LogicalOp|JLogicalOp]] to a `ceylon.ast` [[LogicalOperation]]."
shared LogicalOperation logicalOperationToCeylon(JLogicalOp logicalOperation) {
    assert (is JAndOp|JOrOp logicalOperation);
    switch (logicalOperation)
    case (is JAndOp) { return andOperationToCeylon(logicalOperation); }
    case (is JOrOp) { return orOperationToCeylon(logicalOperation); }
}

"Compiles the given [[code]] for a Logical Operation
 into a [[LogicalOperation]] using the Ceylon compiler
 (more specifically, the rule for a `disjunctionExpression`)."
shared LogicalOperation? compileLogicalOperation(String code) {
    if (is JLogicalOp jDisjunctionExpression = createParser(code).disjunctionExpression()) {
        return logicalOperationToCeylon(jDisjunctionExpression);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    EqualityOperation,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEqualOp=EqualOp,
        JEqualityOp=EqualityOp,
        JIdenticalOp=IdenticalOp,
        JNotEqualOp=NotEqualOp
    }
}

"Converts a RedHat AST [[EqualityOp|JEqualityOp]] or [[IdenticalOp|JIdenticalOp]] to a `ceylon.ast` [[EqualityOperation]]."
shared EqualityOperation equalityOperationToCeylon(JEqualityOp|JIdenticalOp equalityOperation, Anything(JNode, Node) update = noop) {
    assert (is JEqualOp|JNotEqualOp|JIdenticalOp equalityOperation);
    switch (equalityOperation)
    case (is JEqualOp) { return equalOperationToCeylon(equalityOperation, update); }
    case (is JNotEqualOp) { return notEqualOperationToCeylon(equalityOperation, update); }
    case (is JIdenticalOp) { return identicalOperationToCeylon(equalityOperation, update); }
}

"Parses the given [[code]] for an Equality Operation
 into an [[EqualityOperation]] using the Ceylon compiler
 (more specifically, the rule for an `equalityExpression`)."
shared EqualityOperation? parseEqualityOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JEqualityOp|JIdenticalOp jEqualityExpression = createParser(code).equalityExpression()) {
        return equalityOperationToCeylon(jEqualityExpression, update);
    } else {
        return null;
    }
}

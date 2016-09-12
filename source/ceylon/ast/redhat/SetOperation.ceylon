import ceylon.ast.core {
    Node,
    SetOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBitwiseOp=BitwiseOp,
        JComplementOp=ComplementOp,
        JIntersectionOp=IntersectionOp,
        JUnionOp=UnionOp
    }
}

"Converts a RedHat AST [[BitwiseOp|JBitwiseOp]] to a `ceylon.ast` [[SetOperation]]."
shared SetOperation setOperationToCeylon(JBitwiseOp setOperation, Anything(JNode,Node) update = noop) {
    assert (is JIntersectionOp|JUnionOp|JComplementOp setOperation);
    switch (setOperation)
    case (is JIntersectionOp) { return intersectionOperationToCeylon(setOperation, update); }
    case (is JUnionOp) { return unionOperationToCeylon(setOperation, update); }
    case (is JComplementOp) { return complementOperationToCeylon(setOperation, update); }
}

"Parses the given [[code]] for a Set Operation
 into a [[SetOperation]] using the Ceylon compiler
 (more specifically, the rule for a `unionExpression`)."
shared SetOperation? parseSetOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JBitwiseOp jUnionExpression = createParser(code).unionExpression()) {
        return setOperationToCeylon(jUnionExpression, update);
    } else {
        return null;
    }
}

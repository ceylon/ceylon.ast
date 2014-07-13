import ceylon.ast.core {
    SetOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionOp=IntersectionOp,
        JBitwiseOp=BitwiseOp
    }
}

"Converts a RedHat AST [[BitwiseOp|JBitwiseOp]] to a `ceylon.ast` [[SetOperation]]."
shared SetOperation setOperationToCeylon(JBitwiseOp setOperation) {
    assert (is JIntersectionOp setOperation);
    switch (setOperation)
    case (is JIntersectionOp) { return intersectionOperationToCeylon(setOperation); }
}

"Compiles the given [[code]] for a Set Operation
 into a [[SetOperation]] using the Ceylon compiler
 (more specifically, the rule for a `unionExpression`)."
shared SetOperation? compileSetOperation(String code) {
    if (is JBitwiseOp jUnionExpression = createParser(code).unionExpression()) {
        return setOperationToCeylon(jUnionExpression);
    } else {
        return null;
    }
}

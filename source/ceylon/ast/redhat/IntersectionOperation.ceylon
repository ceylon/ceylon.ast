import ceylon.ast.core {
    IntersectionOperation,
    Precedence3Expression,
    Precedence4Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionOp=IntersectionOp
    }
}

"Converts a RedHat AST [[IntersectionOp|JIntersectionOp]] to a `ceylon.ast` [[IntersectionOperation]]."
shared IntersectionOperation intersectionOperationToCeylon(JIntersectionOp intersectionOperation) {
    "Check precedence"
    assert (is Precedence4Expression left = expressionToCeylon(intersectionOperation.leftTerm),
        is Precedence3Expression right = expressionToCeylon(intersectionOperation.rightTerm));
    return IntersectionOperation(left, right);
}

"Compiles the given [[code]] for an Intersection Operation
 into an [[IntersectionOperation]] using the Ceylon compiler
 (more specifically, the rule for an `intersectionExpression`)."
shared IntersectionOperation? compileIntersectionOperation(String code) {
    if (is JIntersectionOp jIntersectionOperation = createParser(code).intersectionExpression()) {
        return intersectionOperationToCeylon(jIntersectionOperation);
    } else {
        return null;
    }
}

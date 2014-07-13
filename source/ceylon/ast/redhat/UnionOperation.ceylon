import ceylon.ast.core {
    Precedence4Expression,
    Precedence5Expression,
    UnionOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionOp=UnionOp
    }
}

"Converts a RedHat AST [[UnionOp|JUnionOp]] to a `ceylon.ast` [[UnionOperation]]."
shared UnionOperation unionOperationToCeylon(JUnionOp unionOperation) {
    "Check precedence"
    assert (is Precedence5Expression left = expressionToCeylon(unionOperation.leftTerm),
        is Precedence4Expression right = expressionToCeylon(unionOperation.rightTerm));
    return UnionOperation(left, right);
}

"Compiles the given [[code]] for a Union Operation
 into an [[UnionOperation]] using the Ceylon compiler
 (more specifically, the rule for a `unionExpression`)."
shared UnionOperation? compileUnionOperation(String code) {
    if (is JUnionOp jUnionExpression = createParser(code).unionExpression()) {
        return unionOperationToCeylon(jUnionExpression);
    } else {
        return null;
    }
}

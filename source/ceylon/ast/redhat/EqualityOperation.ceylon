import ceylon.ast.core {
    EqualityOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEqualOp=EqualOp,
        JEqualityOp=EqualityOp,
        JIdenticalOp=IdenticalOp,
        JNotEqualOp=NotEqualOp
    }
}

"Converts a RedHat AST [[EqualityOp|JEqualityOp]] or [[IdenticalOp|JIdenticalOp]] to a `ceylon.ast` [[EqualityOperation]]."
shared EqualityOperation equalityOperationToCeylon(JEqualityOp|JIdenticalOp equalityOperation) {
    assert (is JEqualOp|JNotEqualOp|JIdenticalOp equalityOperation);
    switch (equalityOperation)
    case (is JEqualOp) { return equalOperationToCeylon(equalityOperation); }
    case (is JNotEqualOp) { return notEqualOperationToCeylon(equalityOperation); }
    case (is JIdenticalOp) { return identicalOperationToCeylon(equalityOperation); }
}

"Compiles the given [[code]] for an Equality Operation
 into an [[EqualityOperation]] using the Ceylon compiler
 (more specifically, the rule for an `equalityExpression`)."
shared EqualityOperation? compileEqualityOperation(String code) {
    if (is JEqualityOp|JIdenticalOp jEqualityExpression = createParser(code).equalityExpression()) {
        return equalityOperationToCeylon(jEqualityExpression);
    } else {
        return null;
    }
}

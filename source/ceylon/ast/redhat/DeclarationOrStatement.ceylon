import ceylon.ast.core {
    Declaration,
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration,
        JExecutableStatement=ExecutableStatement,
        JStatement=Statement
    }
}

"Converts a RedHat AST [[JStatement|Statement]] to a `ceylon.ast`
 [[Declaration]] or [[Statement]]."
shared Declaration|Statement declarationOrStatementToCeylon(JStatement declarationOrStatement) {
    assert (is JDeclaration|JExecutableStatement declarationOrStatement);
    switch (declarationOrStatement)
    case (is JDeclaration) { return declarationToCeylon(declarationOrStatement); }
    case (is JExecutableStatement) { return statementToCeylon(declarationOrStatement); }
}

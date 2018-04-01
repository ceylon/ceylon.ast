import ceylon.ast.core {
    Declaration,
    Node,
    Statement
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDeclaration=Declaration,
        JExecutableStatement=ExecutableStatement,
        JStatement=Statement
    }
}

"Converts a RedHat AST [[JStatement|Statement]] to a `ceylon.ast`
 [[Declaration]] or [[Statement]]."
shared Declaration|Statement declarationOrStatementToCeylon(JStatement declarationOrStatement, Anything(JNode, Node) update = noop) {
    assert (is JDeclaration|JExecutableStatement declarationOrStatement);
    switch (declarationOrStatement)
    case (is JDeclaration) { return declarationToCeylon(declarationOrStatement, update); }
    case (is JExecutableStatement) { return statementToCeylon(declarationOrStatement, update); }
}

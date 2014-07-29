import ceylon.ast.core {
    Declaration,
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration,
        JStatement=Statement
    }
}

"Converts a RedHat AST [[JStatement|Statement]] to a `ceylon.ast`
 [[Declaration]] or [[Statement]]."
shared Declaration|Statement declarationOrStatementToCeylon(JStatement declarationOrStatement) {
    if (is JDeclaration declarationOrStatement) {
        return declarationToCeylon(declarationOrStatement);
    } else {
        return statementToCeylon(declarationOrStatement);
    }
}

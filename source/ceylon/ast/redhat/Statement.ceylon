import ceylon.ast.core {
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration,
        JSpecifierStatement=SpecifierStatement,
        JStatement=Statement
    }
}

"Converts a RedHat AST [[Statement|JStatement]] to a `ceylon.ast` [[Statement]].
 
 Warning: This function can *not* be used to convert a RedHat AST [[Declaration|JDeclaration]]
 to a `ceylon.ast` [[Declaration|ceylon.ast.core::Declaration]] (in the RedHat AST,
 `Declaration` is a subclass of `Statement`).
 If you’re unsure if your RedHat AST `Statement` is a `Statement` or a `Declaration`,
 use [[declarationOrStatementToCeylon]]."
shared Statement statementToCeylon(JStatement statement) {
    "This function cannot be used for declarations!"
    assert (!is JDeclaration statement);
    assert (is JSpecifierStatement statement);
    switch (statement)
    case (is JSpecifierStatement) { return specificationToCeylon(statement); }
}

"Compiles the given [[code]] for a Statement
 into a [[Statement]] using the Ceylon compiler
 (more specifically, the rule for a `statement`)."
shared Statement? compileStatement(String code) {
    if (exists jStatement = createParser(code).statement()) {
        return statementToCeylon(jStatement);
    } else {
        return null;
    }
}

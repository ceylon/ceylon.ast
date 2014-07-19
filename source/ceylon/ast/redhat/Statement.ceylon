import ceylon.ast.core {
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement,
        JStatement=Statement
    }
}

"Converts a RedHat AST [[Statement|JStatement]] to a `ceylon.ast` [[Statement]]."
shared Statement statementToCeylon(JStatement statement) {
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

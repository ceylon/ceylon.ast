import ceylon.ast.core {
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExecutableStatement=ExecutableStatement,
        JExpressionStatement=ExpressionStatement,
        JSpecifierStatement=SpecifierStatement
    }
}

"Converts a RedHat AST [[ExecutableStatement|JExecutableStatement]] to a `ceylon.ast` [[Statement]].
 
 (RedHat AST’s [[Statement|com.redhat.ceylon.compiler.typechecker.tree::Tree.Statement]]
 is the supertype of [[Declaration|com.redhat.ceylon.compiler.typechecker.tree::Tree.Declaration]]
 and [[ExecutableStatement|com.redhat.ceylon.compiler.typechecker.tree::Tree.ExecutableStatement]]
 and used as `Declaration|Statement` in [[Body|com.redhat.ceylon.compiler.typechecker.tree::Tree.Body]].)"
shared Statement statementToCeylon(JExecutableStatement statement) {
    assert (is JSpecifierStatement|JExpressionStatement statement);
    switch (statement)
    case (is JSpecifierStatement) { return specificationToCeylon(statement); }
    case (is JExpressionStatement) { return expressionStatementToCeylon(statement); }
}

"Compiles the given [[code]] for a Statement
 into a [[Statement]] using the Ceylon compiler
 (more specifically, the rule for a `statement`)."
shared Statement? compileStatement(String code) {
    if (exists jStatement = createParser(code).statement()) {
        assert (is JExecutableStatement jStatement);
        return statementToCeylon(jStatement);
    } else {
        return null;
    }
}

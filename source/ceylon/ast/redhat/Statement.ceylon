import ceylon.ast.core {
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssertion=Assertion,
        JControlStatement=ControlStatement,
        JDestructure=Destructure,
        JDirective=Directive,
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
    assert (is JSpecifierStatement|JExpressionStatement|JAssertion|JDirective|JControlStatement|JDestructure statement);
    switch (statement)
    case (is JSpecifierStatement) { return specificationToCeylon(statement); }
    case (is JExpressionStatement) { return expressionStatementToCeylon(statement); }
    case (is JAssertion) { return assertionToCeylon(statement); }
    case (is JDirective) { return directiveToCeylon(statement); }
    case (is JControlStatement) { return controlStructureToCeylon(statement); }
    case (is JDestructure) { return destructureToCeylon(statement); }
}

"Compiles the given [[code]] for a Statement
 into a [[Statement]] using the Ceylon compiler
 (more specifically, the rule for a `declarationOrStatement`)."
shared Statement? compileStatement(String code) {
    if (is JExecutableStatement jDeclarationOrStatement = createParser(code).declarationOrStatement()) {
        // declaration() doesn’t include assertions
        return statementToCeylon(jDeclarationOrStatement);
    } else {
        return null;
    }
}

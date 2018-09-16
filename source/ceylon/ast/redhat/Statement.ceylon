import ceylon.ast.core {
    Node,
    Statement
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAssertion=Assertion,
        JControlStatement=ControlStatement,
        JDestructure=Destructure,
        JDirective=Directive,
        JExecutableStatement=ExecutableStatement,
        JExpressionStatement=ExpressionStatement,
        JLetStatement=LetStatement,
        JSpecifierStatement=SpecifierStatement
    }
}

"Converts a RedHat AST [[ExecutableStatement|JExecutableStatement]] to a `ceylon.ast` [[Statement]].
 
 (RedHat AST’s [[Statement|org.eclipse.ceylon.compiler.typechecker.tree::Tree.Statement]]
 is the supertype of [[Declaration|org.eclipse.ceylon.compiler.typechecker.tree::Tree.Declaration]]
 and [[ExecutableStatement|org.eclipse.ceylon.compiler.typechecker.tree::Tree.ExecutableStatement]]
 and used as `Declaration|Statement` in [[Body|org.eclipse.ceylon.compiler.typechecker.tree::Tree.Body]].)"
shared Statement statementToCeylon(JExecutableStatement statement, Anything(JNode, Node) update = noop) {
    assert (is JSpecifierStatement|JExpressionStatement|JAssertion|JDirective|JControlStatement|JLetStatement statement);
    switch (statement)
    case (is JSpecifierStatement) { return specificationToCeylon(statement, update); }
    case (is JExpressionStatement) { return expressionStatementToCeylon(statement, update); }
    case (is JAssertion) { return assertionToCeylon(statement, update); }
    case (is JDirective) { return directiveToCeylon(statement, update); }
    case (is JControlStatement) { return controlStructureToCeylon(statement, update); }
    case (is JLetStatement) { return destructureToCeylon(statement, update); }
}

"Parses the given [[code]] for a Statement
 into a [[Statement]] using the Ceylon compiler
 (more specifically, the rule for a `declarationOrStatement`)."
shared Statement? parseStatement(String code, Anything(JNode, Node) update = noop) {
    if (is JExecutableStatement jDeclarationOrStatement = createParser(code).declarationOrStatement()) {
        // declaration() doesn’t include assertions
        return statementToCeylon(jDeclarationOrStatement, update);
    } else {
        return null;
    }
}

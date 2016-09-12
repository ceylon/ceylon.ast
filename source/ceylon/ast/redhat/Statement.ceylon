import ceylon.ast.core {
    Node,
    Statement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared Statement statementToCeylon(JExecutableStatement statement, Anything(JNode,Node) update = noop) {
    assert (is JSpecifierStatement|JExpressionStatement|JAssertion|JDirective|JControlStatement|JDestructure statement);
    switch (statement)
    case (is JSpecifierStatement) { return specificationToCeylon(statement, update); }
    case (is JExpressionStatement) { return expressionStatementToCeylon(statement, update); }
    case (is JAssertion) { return assertionToCeylon(statement, update); }
    case (is JDirective) { return directiveToCeylon(statement, update); }
    case (is JControlStatement) { return controlStructureToCeylon(statement, update); }
    case (is JDestructure) { return destructureToCeylon(statement, update); }
}

"Parses the given [[code]] for a Statement
 into a [[Statement]] using the Ceylon compiler
 (more specifically, the rule for a `declarationOrStatement`)."
shared Statement? parseStatement(String code, Anything(JNode,Node) update = noop) {
    if (is JExecutableStatement jDeclarationOrStatement = createParser(code).declarationOrStatement()) {
        // declaration() doesn’t include assertions
        return statementToCeylon(jDeclarationOrStatement, update);
    } else {
        return null;
    }
}

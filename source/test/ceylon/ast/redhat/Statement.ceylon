import ceylon.ast.core {
    Statement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    statementToCeylon,
    parseStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExecutableStatement=ExecutableStatement
    }
}

shared object statement satisfies AbstractTest<Statement,JExecutableStatement> {
    parse = parseStatement;
    fromCeylon = RedHatTransformer.transformStatement;
    toCeylon = statementToCeylon;
    
    tests = [specification, expressionStatement, assertion, directive, controlStructure, destructure];
}

import ceylon.ast.core {
    ExpressionStatement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    expressionStatementToCeylon,
    parseExpressionStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionStatement=ExpressionStatement
    }
}

shared object expressionStatement satisfies AbstractTest<ExpressionStatement,JExpressionStatement> {
    parse = parseExpressionStatement;
    fromCeylon = RedHatTransformer.transformExpressionStatement;
    toCeylon = expressionStatementToCeylon;
    
    tests = [assignmentStatement, prefixPostfixStatement, invocationStatement];
}

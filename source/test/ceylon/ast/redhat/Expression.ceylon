import ceylon.ast.core {
    Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    expressionToCeylon,
    parseExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTerm=Term
    }
}

shared object expression satisfies AbstractTest<Expression,JTerm> {
    parse = parseExpression;
    fromCeylon = RedHatTransformer.transformExpression;
    toCeylon = expressionToCeylon;
    
    tests = [primary, operation, functionExpression, letExpression, conditionalExpression];
}

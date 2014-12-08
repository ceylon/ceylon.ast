import ceylon.ast.core {
    Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    expressionToCeylon,
    compileExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTerm=Term
    }
}

shared object expression satisfies AbstractTest<Expression,JTerm> {
    compile = compileExpression;
    fromCeylon = RedHatTransformer.transformExpression;
    toCeylon = expressionToCeylon;
    
    tests = [primary, operation, functionExpression, letExpression, conditionalExpression];
}

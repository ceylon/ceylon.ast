import ceylon.ast.core {
    Expression,
    GroupedExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedExpressionToCeylon,
    compileGroupedExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpression=Expression
    }
}

shared object groupedExpression satisfies ConcreteTest<GroupedExpression,JExpression> {
    
    String->GroupedExpression construct(String->Expression expr)
            => "(``expr.key``)"->GroupedExpression(expr.item);
    
    shared String->GroupedExpression oneIntegerLiteralGroupedExpression = construct(integerLiteral.oneIntegerLiteral);
    
    compile = compileGroupedExpression;
    fromCeylon = RedHatTransformer.transformGroupedExpression;
    toCeylon = groupedExpressionToCeylon;
    codes = [oneIntegerLiteralGroupedExpression];
}

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
    
    shared actual GroupedExpression? compile(String code) => compileGroupedExpression(code);
    shared actual JExpression fromCeylon(RedHatTransformer transformer)(GroupedExpression node) => transformer.transformGroupedExpression(node);
    shared actual GroupedExpression toCeylon(JExpression node) => groupedExpressionToCeylon(node);
    codes = [oneIntegerLiteralGroupedExpression];
}

import ceylon.ast.core {
    Expression,
    GroupedExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedExpressionToCeylon,
    parseGroupedExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JParExpression=ParExpression
    }
}

shared object groupedExpression satisfies ConcreteTest<GroupedExpression,JParExpression> {
    
    String->GroupedExpression construct(String->Expression expr)
            => "(``expr.key``)" -> GroupedExpression(expr.item);
    
    shared String->GroupedExpression oneIntegerLiteralGroupedExpression = construct(integerLiteral.oneIntegerLiteral);
    
    // not tested directly, but used by other tests
    shared String->GroupedExpression nameElseWorldStringLiteralGroupedExpression = construct(elseOperation.nameElseWorldStringLiteralExpression);
    
    parse = parseGroupedExpression;
    fromCeylon = RedHatTransformer.transformGroupedExpression;
    toCeylon = groupedExpressionToCeylon;
    codes = [oneIntegerLiteralGroupedExpression];
}

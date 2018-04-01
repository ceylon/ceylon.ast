import ceylon.ast.core {
    Expression,
    LazySpecifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    lazySpecifierToCeylon,
    parseLazySpecifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression
    }
}

shared object lazySpecifier satisfies ConcreteTest<LazySpecifier,JLazySpecifierExpression> {
    
    String->LazySpecifier construct(String->Expression expression)
            => "=>``expression.key``" -> LazySpecifier(expression.item);
    
    shared String->LazySpecifier aTimesBPlusCLazySpecifier = construct(sumOperation.aTimesBPlusCExpression);
    shared String->LazySpecifier groupedLazySpecifier = construct(groupedExpression.nameElseWorldStringLiteralGroupedExpression);
    
    // not tested directly, but used by other tests
    shared String->LazySpecifier assignLazySpecifier = construct(assignOperation.textAssignExpression);
    shared String->LazySpecifier xyStringSpecifier = construct(stringTemplate.xyStringTemplate);
    
    parse = parseLazySpecifier;
    fromCeylon = RedHatTransformer.transformLazySpecifier;
    toCeylon = lazySpecifierToCeylon;
    codes = [aTimesBPlusCLazySpecifier, groupedLazySpecifier];
}

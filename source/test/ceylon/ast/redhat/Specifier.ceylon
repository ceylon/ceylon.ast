import ceylon.ast.core {
    Expression,
    Specifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    specifierToCeylon,
    parseSpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierExpression=SpecifierExpression
    }
}

shared object specifier satisfies ConcreteTest<Specifier,JSpecifierExpression> {
    
    String->Specifier construct(String->Expression expression)
            => "=``expression.key``"->Specifier(expression.item);
    
    shared String->Specifier oneSpecifier = construct(integerLiteral.oneIntegerLiteral);
    shared String->Specifier nameElseWorldStringLiteralGroupedSpecifier = construct(groupedExpression.nameElseWorldStringLiteralGroupedExpression);
    shared String->Specifier keyGivenDecSpecifier = construct(givenDec.keyGivenDec);
    
    // not tested directly, but used by other tests
    shared String->Specifier _0Specifier = construct(integerLiteral._0IntegerLiteral);
    shared String->Specifier _00Specifier = construct(floatLiteral.oPointOFloatLiteral);
    shared String->Specifier processArgumentsFirstSpecifier = construct(qualifiedExpression.processArgumentsFirstExpression);
    shared String->Specifier processArgumentsSequenceSpecifier = construct(invocation.processArgumentsSequenceInvocation);
    shared String->Specifier xSpecifier = construct(baseExpression.xExpression);
    shared String->Specifier ySpecifier = construct(baseExpression.yExpression);
    shared String->Specifier rSpecifier = construct(baseExpression.rExpression);
    shared String->Specifier phiSpecifier = construct(baseExpression.phiExpression);
    shared String->Specifier sqrtSpecifier = construct(invocation.sqrtInvocation);
    shared String->Specifier atan2Specifier = construct(invocation.atan2Invocation);
    shared String->Specifier rTimesCosSpecifier = construct(productOperation.rTimesCosExpression);
    shared String->Specifier rTimesSinSpecifier = construct(productOperation.rTimesSinExpression);
    
    parse = parseSpecifier;
    fromCeylon = RedHatTransformer.transformSpecifier;
    toCeylon = specifierToCeylon;
    codes = [oneSpecifier, nameElseWorldStringLiteralGroupedSpecifier, keyGivenDecSpecifier];
}

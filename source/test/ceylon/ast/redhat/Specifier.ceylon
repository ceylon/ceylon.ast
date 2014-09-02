import ceylon.ast.core {
    Expression,
    Specifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    specifierToCeylon,
    compileSpecifier
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
    shared String->Specifier processArgumentsFirstSpecifier = construct(qualifiedExpression.processArgumentsFirstExpression);
    shared String->Specifier processArgumentsSequenceSpecifier = construct(invocation.processArgumentsSequenceInvocation);
    
    compile = compileSpecifier;
    fromCeylon = RedHatTransformer.transformSpecifier;
    toCeylon = specifierToCeylon;
    codes = [oneSpecifier, nameElseWorldStringLiteralGroupedSpecifier, keyGivenDecSpecifier];
}

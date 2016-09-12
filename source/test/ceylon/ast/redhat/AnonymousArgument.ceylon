import ceylon.ast.core {
    AnonymousArgument,
    Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anonymousArgumentToCeylon,
    parseAnonymousArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifiedArgument=SpecifiedArgument
    }
}

shared object anonymousArgument satisfies ConcreteTest<AnonymousArgument,JSpecifiedArgument> {
    
    String->AnonymousArgument construct(String->Expression expression)
            => "``expression.key``;"->AnonymousArgument(expression.item);
    
    shared String->AnonymousArgument aTimesBPlusCAnonymousArgument = construct(sumOperation.aTimesBPlusCExpression);
    shared String->AnonymousArgument cInAIntersectBAnonymousArgument = construct(inOperation.cInAIntersectBExpression);
    
    parse = parseAnonymousArgument;
    fromCeylon = RedHatTransformer.transformAnonymousArgument;
    toCeylon = anonymousArgumentToCeylon;
    codes = [aTimesBPlusCAnonymousArgument, cInAIntersectBAnonymousArgument];
}

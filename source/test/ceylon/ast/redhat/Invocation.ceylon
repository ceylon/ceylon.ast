import ceylon.ast.core {
    Arguments,
    Invocation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    invocationToCeylon,
    parseInvocation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression
    }
}

shared object invocation satisfies ConcreteTest<Invocation,JInvocationExpression> {
    
    String->Invocation construct(String->Primary invoked, String->Arguments arguments)
            => "``invoked.key````arguments.key``" -> Invocation(invoked.item, arguments.item);
    
    shared String->Invocation printHelloWorldInvocation = construct(baseExpression.printExpression, positionalArguments.helloWorldPositionalArguments);
    shared String->Invocation namedArgumentsInvocation => construct(baseExpression.printExpression, namedArguments.sizeSpecify0NamedArguments);
    
    // not tested directly, but used by other tests
    shared String->Invocation assertionErrorInvocation = construct(baseExpression.assertionErrorExpression, positionalArguments.emptyPositionalArguments);
    shared String->Invocation processArgumentsSequenceInvocation = construct(qualifiedExpression.processArgumentsSequenceQualifiedExpression, positionalArguments.emptyPositionalArguments);
    shared String->Invocation printPersonNameInvocation = construct(baseExpression.printExpression, positionalArguments.personNamePositionalArguments);
    shared String->Invocation sqrtInvocation = construct(baseExpression.sqrtExpression, positionalArguments.xySquaredSumPositionalArguments);
    shared String->Invocation atan2Invocation = construct(baseExpression.atan2Expression, positionalArguments.yxPositionalArguments);
    shared String->Invocation cosPhiInvocation = construct(baseExpression.cosExpression, positionalArguments.phiPositionalArguments);
    shared String->Invocation sinPhiInvocation = construct(baseExpression.sinExpression, positionalArguments.phiPositionalArguments);
    
    parse = parseInvocation;
    fromCeylon = RedHatTransformer.transformInvocation;
    toCeylon = invocationToCeylon;
    codes => [printHelloWorldInvocation, namedArgumentsInvocation];
}

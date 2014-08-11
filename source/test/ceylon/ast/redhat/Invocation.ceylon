import ceylon.ast.core {
    Arguments,
    Invocation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    invocationToCeylon,
    compileInvocation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression
    }
}

shared object invocation satisfies ConcreteTest<Invocation,JInvocationExpression> {
    
    String->Invocation construct(String->Primary invoked, String->Arguments arguments)
            => "``invoked.key````arguments.key``"->Invocation(invoked.item, arguments.item);
    
    shared String->Invocation printHelloWorldInvocation = construct(baseExpression.printExpression, positionalArguments.helloWorldPositionalArguments);
    
    // not tested directly, but used by other tests
    shared String->Invocation assertionErrorInvocation = construct(baseExpression.assertionErrorExpression, positionalArguments.emptyPositionalArguments);
    
    compile = compileInvocation;
    fromCeylon = RedHatTransformer.transformInvocation;
    toCeylon = invocationToCeylon;
    codes = [printHelloWorldInvocation];
}

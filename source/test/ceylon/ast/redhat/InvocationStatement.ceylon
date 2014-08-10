import ceylon.ast.core {
    Invocation,
    InvocationStatement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    invocationStatementToCeylon,
    compileInvocationStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionStatement=ExpressionStatement
    }
}

shared object invocationStatement satisfies ConcreteTest<InvocationStatement,JExpressionStatement> {
    
    String->InvocationStatement construct(String->Invocation expression)
            => "``expression.key``;"->InvocationStatement(expression.item);
    
    shared String->InvocationStatement printHelloWorldStatement = construct(invocation.printHelloWorldInvocation);
    
    compile = compileInvocationStatement;
    fromCeylon = RedHatTransformer.transformInvocationStatement;
    toCeylon = invocationStatementToCeylon;
    codes = [printHelloWorldStatement];
}

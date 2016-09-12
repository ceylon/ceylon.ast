import ceylon.ast.core {
    Invocation,
    InvocationStatement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    invocationStatementToCeylon,
    parseInvocationStatement
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
    shared String->InvocationStatement printPersonNameStatement = construct(invocation.printPersonNameInvocation);
    
    parse = parseInvocationStatement;
    fromCeylon = RedHatTransformer.transformInvocationStatement;
    toCeylon = invocationStatementToCeylon;
    codes = [printHelloWorldStatement, printPersonNameStatement];
}

import ceylon.ast.core {
    Expression,
    MemberNameWithTypeArguments,
    OperatorStyleInvocation,
    Precedence16Expression,
    lidentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    operatorStyleInvocationToCeylon,
    compileOperatorStyleInvocation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression
    }
}

shared object operatorStyleInvocation satisfies ConcreteTest<OperatorStyleInvocation,JInvocationExpression> {
    
    String->OperatorStyleInvocation construct(String->Precedence16Expression receiverExpression, <String->MemberNameWithTypeArguments>|String nameAndArgs, String->Expression argument) {
        switch (nameAndArgs)
        case (is String->MemberNameWithTypeArguments) {
            return "``receiverExpression.key`` ``nameAndArgs.key`` ``argument.key``"->OperatorStyleInvocation(receiverExpression.item, nameAndArgs.item, argument.item);
        }
        case (is String) {
            return "``receiverExpression.key`` ``nameAndArgs`` ``argument.key``"->OperatorStyleInvocation(receiverExpression.item, MemberNameWithTypeArguments(lidentifier(nameAndArgs)), argument.item);
        }
    }
    
    shared String->OperatorStyleInvocation operatorStyleInvocation = construct(baseExpression.nameExpression, "map", functionExpression.functionFunctionExpression);
    
    compile = compileOperatorStyleInvocation;
    fromCeylon = RedHatTransformer.transformOperatorStyleInvocation;
    toCeylon = operatorStyleInvocationToCeylon;
    codes = [operatorStyleInvocation];
}

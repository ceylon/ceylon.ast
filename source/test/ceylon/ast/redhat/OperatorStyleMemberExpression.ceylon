import ceylon.ast.core {
    MemberNameWithTypeArguments,
    OperatorStyleMemberExpression,
    Precedence16Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    operatorStyleMemberExpressionToCeylon,
    compileOperatorStyleMemberExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQualifiedMemberExpression=QualifiedMemberExpression
    }
}

shared object operatorStyleMemberExpression satisfies ConcreteTest<OperatorStyleMemberExpression,JQualifiedMemberExpression> {
    
    String->OperatorStyleMemberExpression construct(String->Precedence16Expression receiverExpression, String->MemberNameWithTypeArguments nameAndArgs)
            => "``receiverExpression.key``  ``nameAndArgs.key``"->OperatorStyleMemberExpression(receiverExpression.item, nameAndArgs.item);
    
    shared String->OperatorStyleMemberExpression todo = construct(baseExpression.nameExpression, identifier.lidLIdentifier.key->MemberNameWithTypeArguments(identifier.lidLIdentifier.item));
    
    compile = compileOperatorStyleMemberExpression;
    fromCeylon = RedHatTransformer.transformOperatorStyleMemberExpression;
    toCeylon = operatorStyleMemberExpressionToCeylon;
    codes = [todo];
}

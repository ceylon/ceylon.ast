import ceylon.ast.core {
    AnyMemberOperator,
    NameWithTypeArguments,
    Primary,
    QualifiedExpression,
    nameWithTypeArguments,
    identifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    qualifiedExpressionToCeylon,
    compileQualifiedExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression
    }
}

shared object qualifiedExpression satisfies ConcreteTest<QualifiedExpression,JQualifiedMemberOrTypeExpression> {
    
    String->QualifiedExpression construct(String->Primary receiverExpression, <String->NameWithTypeArguments>|String nameAndArgs, String->AnyMemberOperator memberOperator = package.memberOperator.memberOperator) {
        switch (nameAndArgs)
        case (is String) {
            return (receiverExpression.key + memberOperator.key + nameAndArgs)->QualifiedExpression(receiverExpression.item, nameWithTypeArguments(identifier(nameAndArgs)), memberOperator.item);
        }
        case (is String->NameWithTypeArguments) {
            return (receiverExpression.key + memberOperator.key + nameAndArgs.key)->QualifiedExpression(receiverExpression.item, nameAndArgs.item, memberOperator.item);
        }
    }
    
    shared String->QualifiedExpression joinWithCommasExpression = construct(stringLiteral.commaStringLiteral, "join");
    shared String->QualifiedExpression processArgumentsExpression = construct(baseExpression.processExpression, "arguments");
    shared String->QualifiedExpression processArgumentsFirstExpression = construct(processArgumentsExpression, "first");
    shared String->QualifiedExpression nameEmptyExpression = construct(baseExpression.nameExpression, "empty");
    shared String->QualifiedExpression peopleSpreadNameExpression = construct(baseExpression.peopleExpression, "name", spreadMemberOperator.spreadMemberOperator);
    shared String->QualifiedExpression processArgumentsFirstSafeLowercasedExpression = construct(processArgumentsFirstExpression, "lowercased", safeMemberOperator.safeMemberOperator);
    
    // not tested directly, but used by other tests
    shared String->QualifiedExpression processArgumentsSequenceQualifiedExpression = construct(processArgumentsExpression, "sequence");
    shared String->QualifiedExpression textIndexedQualifiedExpression = construct(baseExpression.textExpression, "indexed");
    shared String->QualifiedExpression personNameQualifiedExpression = construct(baseExpression.personExpression, "name");
    
    compile = compileQualifiedExpression;
    fromCeylon = RedHatTransformer.transformQualifiedExpression;
    toCeylon = qualifiedExpressionToCeylon;
    codes = [joinWithCommasExpression, processArgumentsFirstExpression, nameEmptyExpression, peopleSpreadNameExpression, processArgumentsFirstSafeLowercasedExpression];
}

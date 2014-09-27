import ceylon.ast.core {
    MemberNameWithTypeArguments,
    OperatorStyleMemberExpression,
    ThenElseExpression,
    TypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInferredTypeArguments=InferredTypeArguments,
        JQualifiedMemberExpression=QualifiedMemberExpression,
        JTypeArgumentList=TypeArgumentList
    }
}

"Converts a RedHat AST operator-style [[QualifiedMemberExpression|JQualifiedMemberExpression]] to a `ceylon.ast` [[OperatorStyleMemberExpression]]."
shared OperatorStyleMemberExpression operatorStyleMemberExpressionToCeylon(JQualifiedMemberExpression operatorStyleMemberExpression) {
    assert (!operatorStyleMemberExpression.memberOperator.mainToken exists);
    assert (is ThenElseExpression receiverExpression = expressionToCeylon(operatorStyleMemberExpression.primary));
    TypeArguments? typeArguments;
    assert (is JInferredTypeArguments|JTypeArgumentList jTypeArgs = operatorStyleMemberExpression.typeArguments);
    switch (jTypeArgs)
    case (is JInferredTypeArguments) { typeArguments = null; }
    case (is JTypeArgumentList) { typeArguments = typeArgumentsToCeylon(jTypeArgs); }
    return OperatorStyleMemberExpression(receiverExpression, MemberNameWithTypeArguments(lIdentifierToCeylon(operatorStyleMemberExpression.identifier), typeArguments));
}

"Compiles the given [[code]] for an Operator-Style Member Expression
 into an [[OperatorStyleMemberExpression]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared OperatorStyleMemberExpression? compileOperatorStyleMemberExpression(String code) {
    if (is JQualifiedMemberExpression jOperatorStyleMemberExpression = createParser(code).assignmentExpression(),
        !jOperatorStyleMemberExpression.memberOperator.mainToken exists) {
        return operatorStyleMemberExpressionToCeylon(jOperatorStyleMemberExpression);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    OperatorStyleExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression,
        JQualifiedMemberExpression=QualifiedMemberExpression
    }
}

"Converts a RedHat AST operator-style [[QualifiedMemberExpression|JQualifiedMemberExpression]]
 or [[InvocationExpression|JInvocationExpression]] to a `ceylon.ast` [[OperatorStyleExpression]]."
shared OperatorStyleExpression operatorStyleExpressionToCeylon(JQualifiedMemberExpression|JInvocationExpression operatorStyleExpression) {
    switch (operatorStyleExpression)
    case (is JInvocationExpression) {
        return operatorStyleInvocationToCeylon(operatorStyleExpression);
    }
    case (is JQualifiedMemberExpression) {
        return operatorStyleMemberExpressionToCeylon(operatorStyleExpression);
    }
}

"Compiles the given [[code]] for an Operator-Style Expression
 into an [[OperatorStyleExpression]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared OperatorStyleExpression? compileOperatorStyleExpression(String code) {
    if (exists jOperatorStyleExpression = createParser(code).assignmentExpression()) {
        if (is JInvocationExpression jOperatorStyleExpression,
            !jOperatorStyleExpression.positionalArgumentList?.mainToken exists && !jOperatorStyleExpression.namedArgumentList exists) {
            return operatorStyleExpressionToCeylon(jOperatorStyleExpression);
        } else if (is JQualifiedMemberExpression jOperatorStyleExpression,
            !jOperatorStyleExpression.memberOperator.mainToken exists) {
            return operatorStyleExpressionToCeylon(jOperatorStyleExpression);
        } else {
            return null;
        }
    } else {
        return null;
    }
}

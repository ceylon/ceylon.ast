import ceylon.ast.core {
    OperatorStyleInvocation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression,
        JListedArgument=ListedArgument,
        JQualifiedMemberExpression=QualifiedMemberExpression
    }
}

"Converts a RedHat AST operator-style [[InvocationExpression|JInvocationExpression]] to a `ceylon.ast` [[OperatorStyleInvocation]]."
shared OperatorStyleInvocation operatorStyleInvocationToCeylon(JInvocationExpression operatorStyleInvocation) {
    "Must be operator-style"
    assert (exists args = operatorStyleInvocation.positionalArgumentList,
        !args.mainToken exists);
    "Must not have named arguments"
    assert (!operatorStyleInvocation.namedArgumentList exists);
    "Must have exactly one argument"
    assert (args.positionalArguments.size() == 1,
        is JListedArgument jArg = args.positionalArguments.get(0));
    "Primary must be operator-style member expression"
    assert (is JQualifiedMemberExpression primary = operatorStyleInvocation.primary);
    value memberExpression = operatorStyleMemberExpressionToCeylon(primary);
    return OperatorStyleInvocation(memberExpression.receiverExpression, memberExpression.nameAndArgs, expressionToCeylon(jArg.expression));
}

"Compiles the given [[code]] for an Operator-Style Invocation
 into an [[OperatorStyleInvocation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared OperatorStyleInvocation? compileOperatorStyleInvocation(String code) {
    if (is JInvocationExpression jOperatorStyleInvocation = createParser(code).assignmentExpression(),
        !jOperatorStyleInvocation.positionalArgumentList?.mainToken exists && !jOperatorStyleInvocation.namedArgumentList exists) {
        return operatorStyleInvocationToCeylon(jOperatorStyleInvocation);
    } else {
        return null;
    }
}

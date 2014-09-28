import ceylon.ast.core {
    Invocation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression,
        JNamedArgumentList=NamedArgumentList,
        JPositionalArgumentList=PositionalArgumentList
    }
}

"Converts a RedHat AST [[InvocationExpression|JInvocationExpression]] to a `ceylon.ast` [[Invocation]]."
shared Invocation invocationToCeylon(JInvocationExpression invocation) {
    value arguments = invocation.positionalArgumentList else invocation.namedArgumentList;
    switch (arguments)
    case (is JPositionalArgumentList) { return Invocation(primaryToCeylon(invocation.primary), positionalArgumentsToCeylon(arguments)); }
    case (is JNamedArgumentList) { return Invocation(primaryToCeylon(invocation.primary), namedArgumentsToCeylon(arguments)); }
}

"Compiles the given [[code]] for an Invocation
 into an [[Invocation]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared Invocation? compileInvocation(String code) {
    if (is JInvocationExpression jPrimary = createParser(code).primary()) {
        return invocationToCeylon(jPrimary);
    } else {
        return null;
    }
}

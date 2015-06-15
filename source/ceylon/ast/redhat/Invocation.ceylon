import ceylon.ast.core {
    Invocation,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInvocationExpression=InvocationExpression,
        JNamedArgumentList=NamedArgumentList,
        JPositionalArgumentList=PositionalArgumentList
    }
}

"Converts a RedHat AST [[InvocationExpression|JInvocationExpression]] to a `ceylon.ast` [[Invocation]]."
shared Invocation invocationToCeylon(JInvocationExpression invocation, Anything(JNode,Node) update = noop) {
    value arguments = invocation.positionalArgumentList else invocation.namedArgumentList;
    Invocation result;
    switch (arguments)
    case (is JPositionalArgumentList) { result = Invocation(primaryToCeylon(invocation.primary, update), positionalArgumentsToCeylon(arguments, update)); }
    case (is JNamedArgumentList) { result = Invocation(primaryToCeylon(invocation.primary, update), namedArgumentsToCeylon(arguments, update)); }
    update(invocation, result);
    return result;
}

"Compiles the given [[code]] for an Invocation
 into an [[Invocation]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared Invocation? compileInvocation(String code, Anything(JNode,Node) update = noop) {
    if (is JInvocationExpression jPrimary = createParser(code).primary()) {
        return invocationToCeylon(jPrimary, update);
    } else {
        return null;
    }
}

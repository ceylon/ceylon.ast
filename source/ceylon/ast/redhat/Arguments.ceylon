import ceylon.ast.core {
    Arguments,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    MissingToken,
    JNode=Node,
    Tree {
        JArgumentList=ArgumentList,
        JNamedArgumentList=NamedArgumentList,
        JPositionalArgumentList=PositionalArgumentList
    }
}

"Converts a RedHat AST [[ArgumentList|JArgumentList]] to a `ceylon.ast` [[Arguments]]."
shared Arguments argumentsToCeylon(JArgumentList arguments, Anything(JNode, Node) update = noop) {
    assert (is JPositionalArgumentList|JNamedArgumentList arguments);
    switch (arguments)
    case (is JPositionalArgumentList) { return positionalArgumentsToCeylon(arguments, update); }
    case (is JNamedArgumentList) { return namedArgumentsToCeylon(arguments, update); }
}

"Parses the given [[code]] for Arguments
 into [[Arguments]] using the Ceylon compiler
 (more specifically, the rule for `namedArguments` and `positionalArguments`)."
shared Arguments? parseArguments(String code, Anything(JNode, Node) update = noop) {
    if (exists jPositionalArguments = createParser(code).positionalArguments(),
        !jPositionalArguments.mainToken is MissingToken) { // by black magic, the parser parses {} as a positional argument list with missing main token, containing an empty iterable.
        return argumentsToCeylon(jPositionalArguments, update);
    } else if (exists jNamedArguments = createParser(code).namedArguments(),
        !jNamedArguments.mainToken is MissingToken) { // same here
        return argumentsToCeylon(jNamedArguments, update);
    } else {
        return null;
    }
}

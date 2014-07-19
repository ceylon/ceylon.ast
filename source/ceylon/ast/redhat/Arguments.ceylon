import ceylon.ast.core {
    Arguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    MissingToken,
    Tree {
        JArgumentList=ArgumentList,
        JNamedArgumentList=NamedArgumentList,
        JPositionalArgumentList=PositionalArgumentList
    }
}

"Converts a RedHat AST [[ArgumentList|JArgumentList]] to a `ceylon.ast` [[Arguments]]."
shared Arguments argumentsToCeylon(JArgumentList arguments) {
    assert (is JPositionalArgumentList|JNamedArgumentList arguments);
    switch (arguments)
    case (is JPositionalArgumentList) { return positionalArgumentsToCeylon(arguments); }
    case (is JNamedArgumentList) { return namedArgumentsToCeylon(arguments); }
}

"Compiles the given [[code]] for Arguments
 into [[Arguments]] using the Ceylon compiler
 (more specifically, the rule for `namedArguments` and `positionalArguments`)."
shared Arguments? compileArguments(String code) {
    if (exists jPositionalArguments = createParser(code).positionalArguments(),
        !jPositionalArguments.mainToken is MissingToken) { // by black magic, the parser parses {} as a positional argument list with missing main token, containing an empty iterable.
        return argumentsToCeylon(jPositionalArguments);
    } else if (exists jNamedArguments = createParser(code).namedArguments(),
        !jNamedArguments.mainToken is MissingToken) { // same here
        return argumentsToCeylon(jNamedArguments);
    } else {
        return null;
    }
}

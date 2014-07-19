import ceylon.ast.core {
    Arguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArgumentList=ArgumentList,
        JPositionalArgumentList=PositionalArgumentList
    }
}

"Converts a RedHat AST [[ArgumentList|JArgumentList]] to a `ceylon.ast` [[Arguments]]."
shared Arguments argumentsToCeylon(JArgumentList arguments) {
    assert (is JPositionalArgumentList arguments);
    switch (arguments)
    case (is JPositionalArgumentList) { return positionalArgumentsToCeylon(arguments); }
    // TODO case (is JNamedArgumentList)
}

"Compiles the given [[code]] for an Arguments
 into an [[Arguments]] using the Ceylon compiler
 (more specifically, the rule for `positionalArguments` and `namedArguments`)."
shared Arguments? compileArguments(String code) {
    if (exists jPositionalArguments = createParser(code).positionalArguments()) {
        return argumentsToCeylon(jPositionalArguments);
    } else if (exists jNamedArguments = createParser(code).namedArguments()) {
        return argumentsToCeylon(jNamedArguments);
    } else {
        return null;
    }
}

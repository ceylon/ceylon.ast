import ceylon.ast.core {
    ArgumentList,
    NamedArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNamedArgumentList=NamedArgumentList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[NamedArgumentList|JNamedArgumentList]] to a `ceylon.ast` [[NamedArguments]]."
shared NamedArguments namedArgumentsToCeylon(JNamedArgumentList namedArguments) {
    ArgumentList iterableArguments;
    if (exists sequencedArgument = namedArguments.sequencedArgument) {
        iterableArguments = argumentListToCeylon(sequencedArgument);
    } else {
        iterableArguments = ArgumentList();
    }
    return NamedArguments(CeylonIterable(namedArguments.namedArguments).collect(namedArgumentToCeylon), iterableArguments);
}

"Compiles the given [[code]] for a Named Arguments
 into a [[NamedArguments]] using the Ceylon compiler
 (more specifically, the rule for a `namedArguments`)."
shared NamedArguments? compileNamedArguments(String code) {
    if (exists jNamedArguments = createParser(code).namedArguments()) {
        return namedArgumentsToCeylon(jNamedArguments);
    } else {
        return null;
    }
}

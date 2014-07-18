import ceylon.ast.core {
    ArgumentList,
    Iterable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceEnumeration=SequenceEnumeration
    }
}

"Converts a RedHat AST [[SequenceEnumeration|JSequenceEnumeration]] to a `ceylon.ast` [[Iterable]]."
shared Iterable iterableToCeylon(JSequenceEnumeration iterable) {
    if (exists args = iterable.sequencedArgument) {
        return Iterable(argumentListToCeylon(args));
    } else {
        return Iterable(ArgumentList());
    }
}

"Compiles the given [[code]] for an Iterable
 into an [[Iterable]] using the Ceylon compiler
 (more specifically, the rule for an `enumeration`)."
shared Iterable? compileIterable(String code) {
    if (exists jEnumeration = createParser(code).enumeration()) {
        return iterableToCeylon(jEnumeration);
    } else {
        return null;
    }
}

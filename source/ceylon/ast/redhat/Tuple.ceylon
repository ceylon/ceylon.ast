import ceylon.ast.core {
    ArgumentList,
    Tuple
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTuple=Tuple
    }
}

"Converts a RedHat AST [[Tuple|JTuple]] to a `ceylon.ast` [[Tuple]]."
shared Tuple tupleToCeylon(JTuple tuple) {
    if (exists args = tuple.sequencedArgument) {
        return Tuple(argumentListToCeylon(args));
    } else {
        return Tuple(ArgumentList());
    }
}

"Compiles the given [[code]] for a Tuple
 into a [[Tuple]] using the Ceylon compiler
 (more specifically, the rule for a `tuple`)."
shared Tuple? compileTuple(String code) {
    if (exists jTuple = createParser(code).tuple()) {
        return tupleToCeylon(jTuple);
    } else {
        return null;
    }
}

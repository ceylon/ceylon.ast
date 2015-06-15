import ceylon.ast.core {
    ArgumentList,
    Iterable,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSequenceEnumeration=SequenceEnumeration
    }
}

"Converts a RedHat AST [[SequenceEnumeration|JSequenceEnumeration]] to a `ceylon.ast` [[Iterable]]."
shared Iterable iterableToCeylon(JSequenceEnumeration iterable, Anything(JNode,Node) update = noop) {
    Iterable result;
    if (exists args = iterable.sequencedArgument) {
        result = Iterable(argumentListToCeylon(args, update));
    } else {
        result = Iterable(ArgumentList());
    }
    update(iterable, result);
    return result;
}

"Compiles the given [[code]] for an Iterable
 into an [[Iterable]] using the Ceylon compiler
 (more specifically, the rule for an `enumeration`)."
shared Iterable? compileIterable(String code, Anything(JNode,Node) update = noop) {
    if (exists jEnumeration = createParser(code).enumeration()) {
        return iterableToCeylon(jEnumeration, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ArgumentList,
    Node,
    Tuple
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTuple=Tuple
    }
}

"Converts a RedHat AST [[Tuple|JTuple]] to a `ceylon.ast` [[Tuple]]."
shared Tuple tupleToCeylon(JTuple tuple, Anything(JNode, Node) update = noop) {
    Tuple result;
    if (exists args = tuple.sequencedArgument) {
        result = Tuple(argumentListToCeylon(args, update));
    } else {
        value argumentList = ArgumentList();
        update(tuple, argumentList);
        result = Tuple(argumentList);
    }
    update(tuple, result);
    return result;
}

"Parses the given [[code]] for a Tuple
 into a [[Tuple]] using the Ceylon compiler
 (more specifically, the rule for a `tuple`)."
shared Tuple? parseTuple(String code, Anything(JNode, Node) update = noop) {
    if (exists jTuple = createParser(code).tuple()) {
        return tupleToCeylon(jTuple, update);
    } else {
        return null;
    }
}

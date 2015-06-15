import ceylon.ast.core {
    Node,
    PrimaryType,
    SequentialType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSequenceType=SequenceType
    }
}

"Converts a RedHat AST [[SequenceType|JSequenceType]] to a `ceylon.ast` [[SequentialType]]."
shared SequentialType sequentialTypeToCeylon(JSequenceType sequentialType, Anything(JNode,Node) update = noop) {
    assert (is PrimaryType element = typeToCeylon(sequentialType.elementType, update));
    value result = SequentialType(element, if (exists jLength = sequentialType.length) then integerLiteralToCeylon(jLength, update) else null);
    update(sequentialType, result);
    return result;
}

"Compiles the given [[code]] for a Sequential Type
 into a [[SequentialType]] using the Ceylon compiler
 (more specifically, the rule for an `primaryType`)."
shared SequentialType? compileSequentialType(String code, Anything(JNode,Node) update = noop) {
    if (is JSequenceType jSequenceType = createParser(code).primaryType()) {
        return sequentialTypeToCeylon(jSequenceType, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    LengthTupleType,
    Node,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceType=SequenceType
    },
    JNode=Node
}

"Converts a RedHat AST [[SequenceType|JSequenceType]] to a `ceylon.ast` [[LengthTupleType]]."
shared LengthTupleType lengthTupleTypeToCeylon(JSequenceType lengthTupleType, Anything(JNode,Node) update = noop) {
    assert (is PrimaryType elementType = typeToCeylon(lengthTupleType.elementType, update));
    assert (exists jLength = lengthTupleType.length);
    value result = LengthTupleType(elementType, integerLiteralToCeylon(jLength, update));
    update(lengthTupleType, result);
    return result;
}

"Compiles the given [[code]] for a Length Tuple Type
 into a [[LengthTupleType]] using the Ceylon compiler
 (more specifically, the rule for a `primaryType`)."
shared LengthTupleType? compileLengthTupleType(String code, Anything(JNode,Node) update = noop) {
    if (is JSequenceType jPrimaryType = createParser(code).primaryType(),
        jPrimaryType.length exists) {
        return lengthTupleTypeToCeylon(jPrimaryType, update);
    } else {
        return null;
    }
}

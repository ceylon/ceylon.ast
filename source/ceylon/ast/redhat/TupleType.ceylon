import ceylon.ast.core {
    TupleType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceType=SequenceType,
        JTupleType=TupleType
    },
    JNode=Node
}

"Converts a RedHat AST [[TupleType|JTupleType]] or [[SequenceType|JSequenceType]] to a `ceylon.ast` [[TupleType]]."
shared TupleType tupleTypeToCeylon(JTupleType|JSequenceType tupleType, Anything(JNode,Node) update = noop) {
    switch (tupleType)
    case (is JTupleType) { return listTupleTypeToCeylon(tupleType, update); }
    case (is JSequenceType) { return lengthTupleTypeToCeylon(tupleType, update); }
}

"Compiles the given [[code]] for a Tuple Type
 into a [[TupleType]] using the Ceylon compiler
 (more specifically, the rule for a `primaryType`)."
shared TupleType? compileTupleType(String code, Anything(JNode,Node) update = noop) {
    if (is JTupleType|JSequenceType jPrimaryType = createParser(code).primaryType()) {
        if (is JSequenceType jPrimaryType, !jPrimaryType.length exists) {
            return null;
        } else {
            return tupleTypeToCeylon(jPrimaryType, update);
        }
    } else {
        return null;
    }
}

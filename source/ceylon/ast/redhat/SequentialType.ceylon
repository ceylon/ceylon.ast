import ceylon.ast.core {
    PrimaryType,
    SequentialType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceType=SequenceType
    }
}

"Converts a RedHat AST [[SequenceType|JSequenceType]] to a `ceylon.ast` [[SequentialType]]."
shared SequentialType sequentialTypeToCeylon(JSequenceType sequentialType) {
    assert (is PrimaryType element = typeToCeylon(sequentialType.elementType));
    return SequentialType(element, if (exists jLength = sequentialType.length) then integerLiteralToCeylon(jLength) else null);
}

"Compiles the given [[code]] for a Sequential Type
 into a [[SequentialType]] using the Ceylon compiler
 (more specifically, the rule for an `primaryType`)."
shared SequentialType? compileSequentialType(String code) {
    if (is JSequenceType jSequenceType = createParser(code).primaryType()) {
        return sequentialTypeToCeylon(jSequenceType);
    } else {
        return null;
    }
}

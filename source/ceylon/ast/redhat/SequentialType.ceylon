import ceylon.ast.api {
    PrimaryType,
    SequentialType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceType=SequenceType
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[SequenceType|JSequenceType]] to a `ceylon.ast` [[SequentialType]]."
shared SequentialType sequentialTypeToCeylon(JSequenceType sequentialType) {
    assert (is PrimaryType element = typeToCeylon(sequentialType.elementType));
    return SequentialType(element);
}

"Compiles the given [[code]] for a Sequential Type
 into a [[SequentialType]] using the Ceylon compiler
 (more specifically, the rule for an `abbreviatedType`)."
shared SequentialType? compileSequentialType(String code) {
    if (is JSequenceType jSequenceType = createParser(code).abbreviatedType()) {
        return sequentialTypeToCeylon(jSequenceType);
    } else {
        return null;
    }
}

import ceylon.ast.api {
    OptionalType,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOptionalType=OptionalType
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[OptionalType|JOptionalType]] to a `ceylon.ast` [[OptionalType]]."
shared OptionalType optionalTypeToCeylon(JOptionalType optionalType) {
    assert (is PrimaryType definite = typeToCeylon(optionalType.definiteType));
    return OptionalType(definite);
}

"Compiles the given [[code]] for an Optional Type
 into an [[OptionalType]] using the Ceylon compiler
 (more specifically, the rule for an `abbreviatedType`)."
shared OptionalType? compileOptionalType(String code) {
    if (is JOptionalType jOptionalType = createParser(code).abbreviatedType()) {
        return optionalTypeToCeylon(jOptionalType);
    } else {
        return null;
    }
}

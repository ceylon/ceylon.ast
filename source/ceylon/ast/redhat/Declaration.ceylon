import ceylon.ast.core {
    Declaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration,
        JMissingDeclaration=MissingDeclaration,
        JTypedDeclaration=TypedDeclaration,
        JTypeDeclaration=TypeDeclaration,
        JTypeParameterDeclaration=TypeParameterDeclaration
    }
}

"Converts a RedHat AST [[Declaration|JDeclaration]] to a `ceylon.ast` [[Declaration]]."
shared Declaration declarationToCeylon(JDeclaration declaration) {
    assert (is JMissingDeclaration|JTypeDeclaration|JTypedDeclaration|JTypeParameterDeclaration declaration);
    switch (declaration)
    case (is JMissingDeclaration) {
        throw AssertionError("Can’t convert a missing declaration");
    }
    case (is JTypeDeclaration) {
        throw AssertionError("Not yet implemented"); // TODO implement type declarations
    }
    case (is JTypedDeclaration) { return typedDeclarationToCeylon(declaration); }
    case (is JTypeParameterDeclaration) {
        throw AssertionError("Can’t convert a type parameter declaration to a declaration");
    }
}

"Compiles the given [[code]] for a Declaration
 into a [[Declaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared Declaration? compileDeclaration(String code) {
    if (exists jDeclaration = createParser(code).declaration()) {
        return declarationToCeylon(jDeclaration);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Declaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeSetterDefinition=AttributeSetterDefinition,
        JDeclaration=Declaration,
        JMissingDeclaration=MissingDeclaration,
        JObjectDefinition=ObjectDefinition,
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
    case (is JTypeDeclaration) { return typeDeclarationToCeylon(declaration); }
    case (is JTypedDeclaration) {
        if (is JObjectDefinition declaration) {
            // in the RedHat AST, ObjectDefinitions are TypedDeclarations, but in ceylon.ast they’re not
            return objectDefinitionToCeylon(declaration);
        } else if (is JAttributeSetterDefinition declaration) {
            // in the RedHat AST, AttributeSetterDefinitions are TypedDeclarations, but in ceylon.ast ValueSetterDefinitions aren’t
            return valueSetterDefinitionToCeylon(declaration);
        } else {
            return typedDeclarationToCeylon(declaration);
        }
    }
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

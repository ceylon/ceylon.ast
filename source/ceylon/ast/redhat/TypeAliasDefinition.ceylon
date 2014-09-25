import ceylon.ast.core {
    TypeAliasDefinition,
    TypeConstraint,
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeAliasDeclaration=TypeAliasDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TypeAliasDeclaration|JTypeAliasDeclaration]] to a `ceylon.ast` [[TypeAliasDefinition]]."
shared TypeAliasDefinition typeAliasDefinitionToCeylon(JTypeAliasDeclaration typeAliasDefinition) {
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = typeAliasDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList);
    } else {
        typeParameters = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = typeAliasDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return TypeAliasDefinition {
        name = uIdentifierToCeylon(typeAliasDefinition.identifier);
        specifier = typeSpecifierToCeylon(typeAliasDefinition.typeSpecifier);
        typeParameters = typeParameters;
        typeConstraints = typeConstraints;
        annotations = annotationsToCeylon(typeAliasDefinition.annotationList);
    };
}

"Compiles the given [[code]] for a Type Alias Definition
 into a [[TypeAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared TypeAliasDefinition? compileTypeAliasDefinition(String code) {
    if (is JTypeAliasDeclaration jTypeAliasDefinition = createParser(code).declaration()) {
        return typeAliasDefinitionToCeylon(jTypeAliasDefinition);
    } else {
        return null;
    }
}

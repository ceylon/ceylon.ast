import ceylon.ast.core {
    InterfaceAliasDefinition,
    CaseTypes,
    TypeConstraint,
    TypeParameters,
    SatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDeclaration=InterfaceDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceDeclaration|JInterfaceDeclaration]] to a `ceylon.ast` [[InterfaceAliasDefinition]]."
shared InterfaceAliasDefinition interfaceAliasDefinitionToCeylon(JInterfaceDeclaration interfaceAliasDefinition) {
    CaseTypes? caseTypes;
    if (exists jCaseTypes = interfaceAliasDefinition.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes);
    } else {
        caseTypes = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = interfaceAliasDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = interfaceAliasDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList);
    } else {
        typeParameters = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = interfaceAliasDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return InterfaceAliasDefinition {
        name = uIdentifierToCeylon(interfaceAliasDefinition.identifier);
        specifier = typeSpecifierToCeylon(interfaceAliasDefinition.typeSpecifier);
        caseTypes = caseTypes;
        satisfiedTypes = satisfiedTypes;
        typeParameters = typeParameters;
        typeConstraints = typeConstraints;
        annotations = annotationsToCeylon(interfaceAliasDefinition.annotationList);
    };
}

"Compiles the given [[code]] for an Interface Alias Definition
 into an [[InterfaceAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared InterfaceAliasDefinition? compileInterfaceAliasDefinition(String code) {
    if (is JInterfaceDeclaration jInterfaceAliasDefinition = createParser(code).declaration()) {
        return interfaceAliasDefinitionToCeylon(jInterfaceAliasDefinition);
    } else {
        return null;
    }
}

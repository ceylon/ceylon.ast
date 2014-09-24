import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassAliasDefinition,
    ExtendedType,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassDeclaration=ClassDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ClassDeclaration|JClassDeclaration]] to a `ceylon.ast` [[ClassAliasDefinition]]."
shared ClassAliasDefinition classAliasDefinitionToCeylon(JClassDeclaration classAliasDefinition) {
    Annotations annotations;
    if (exists jAnnotations = classAliasDefinition.annotationList) {
        annotations = annotationsToCeylon(jAnnotations);
    } else {
        annotations = Annotations();
    }
    TypeParameters? typeParameters;
    if (exists jTypeParameters = classAliasDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameters);
    } else {
        typeParameters = null;
    }
    CaseTypes? caseTypes;
    if (exists jCaseTypes = classAliasDefinition.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes);
    } else {
        caseTypes = null;
    }
    ExtendedType? extendedType;
    if (exists jExtendedType = classAliasDefinition.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = classAliasDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraints = classAliasDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraints.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return ClassAliasDefinition {
        annotations = annotations;
        name = uIdentifierToCeylon(classAliasDefinition.identifier);
        typeParameters = typeParameters;
        parameters = parametersToCeylon(classAliasDefinition.parameterList);
        caseTypes = caseTypes;
        extendedType = extendedType;
        satisfiedTypes = satisfiedTypes;
        typeConstraints = typeConstraints;
        specifier = classSpecifierToCeylon(classAliasDefinition.classSpecifier);
    };
}

"Compiles the given [[code]] for a Class Alias
 into a [[ClassAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassAliasDefinition? compileClassAliasDefinition(String code) {
    if (is JClassDeclaration jDeclaration = createParser(code).declaration()) {
        return classAliasDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}

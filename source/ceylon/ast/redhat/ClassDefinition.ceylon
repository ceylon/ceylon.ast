import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassDefinition,
    ExtendedType,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassDefinition=ClassDefinition
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ClassDefinition|JClassDefinition]] to a `ceylon.ast` [[ClassDefinition]]."
shared ClassDefinition classDefinitionToCeylon(JClassDefinition classDefinition) {
    Annotations annotations;
    if (exists jAnnotations = classDefinition.annotationList) {
        annotations = annotationsToCeylon(jAnnotations);
    } else {
        annotations = Annotations();
    }
    TypeParameters? typeParameters;
    if (exists jTypeParameters = classDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameters);
    } else {
        typeParameters = null;
    }
    CaseTypes? caseTypes;
    if (exists jCaseTypes = classDefinition.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes);
    } else {
        caseTypes = null;
    }
    ExtendedType? extendedType;
    if (exists jExtendedType = classDefinition.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = classDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraints = classDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraints.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return ClassDefinition {
        annotations = annotations;
        name = uIdentifierToCeylon(classDefinition.identifier);
        typeParameters = typeParameters;
        parameters = parametersToCeylon(classDefinition.parameterList);
        caseTypes = caseTypes;
        extendedType = extendedType;
        satisfiedTypes = satisfiedTypes;
        typeConstraints = typeConstraints;
        body = classBodyToCeylon(classDefinition.classBody);
    };
}

"Compiles the given [[code]] for a Class Definition
 into a [[ClassDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassDefinition? compileClassDefinition(String code) {
    if (is JClassDefinition jDeclaration = createParser(code).declaration()) {
        return classDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassAlias,
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

"Converts a RedHat AST [[ClassDeclaration|JClassDeclaration]] to a `ceylon.ast` [[ClassAlias]]."
shared ClassAlias classAliasToCeylon(JClassDeclaration classAlias) {
    Annotations annotations;
    if (exists jAnnotations = classAlias.annotationList) {
        annotations = annotationsToCeylon(jAnnotations);
    } else {
        annotations = Annotations();
    }
    TypeParameters? typeParameters;
    if (exists jTypeParameters = classAlias.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameters);
    } else {
        typeParameters = null;
    }
    CaseTypes? caseTypes;
    if (exists jCaseTypes = classAlias.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes);
    } else {
        caseTypes = null;
    }
    ExtendedType? extendedType;
    if (exists jExtendedType = classAlias.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = classAlias.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraints = classAlias.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraints.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return ClassAlias {
        annotations = annotations;
        name = uIdentifierToCeylon(classAlias.identifier);
        typeParameters = typeParameters;
        parameters = parametersToCeylon(classAlias.parameterList);
        caseTypes = caseTypes;
        extendedType = extendedType;
        satisfiedTypes = satisfiedTypes;
        typeConstraints = typeConstraints;
        specifier = classSpecifierToCeylon(classAlias.classSpecifier);
    };
}

"Compiles the given [[code]] for a Class Alias
 into a [[ClassAlias]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassAlias? compileClassAlias(String code) {
    if (is JClassDeclaration jDeclaration = createParser(code).declaration()) {
        return classAliasToCeylon(jDeclaration);
    } else {
        return null;
    }
}

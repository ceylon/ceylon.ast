import ceylon.ast.core {
    Annotations,
    ClassAliasDefinition
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
shared ClassAliasDefinition classAliasDefinitionToCeylon(JClassDeclaration classAliasDefinition)
        => ClassAliasDefinition {
    name = uIdentifierToCeylon(classAliasDefinition.identifier);
    parameters = parametersToCeylon(classAliasDefinition.parameterList);
    specifier = classSpecifierToCeylon(classAliasDefinition.classSpecifier);
    value caseTypes {
        if (exists jCaseTypes = classAliasDefinition.caseTypes) {
            return caseTypesToCeylon(jCaseTypes);
        } else {
            return null;
        }
    }
    value extendedType {
        if (exists jExtendedType = classAliasDefinition.extendedType) {
            return extendedTypeToCeylon(jExtendedType);
        } else {
            return null;
        }
    }
    value satisfiedTypes {
        if (exists jSatisfiedTypes = classAliasDefinition.satisfiedTypes) {
            return satisfiedTypesToCeylon(jSatisfiedTypes);
        } else {
            return null;
        }
    }
    value typeParameters {
        if (exists jTypeParameters = classAliasDefinition.typeParameterList) {
            return typeParametersToCeylon(jTypeParameters);
        } else {
            return null;
        }
    }
    value typeConstraints {
        if (exists jTypeConstraints = classAliasDefinition.typeConstraintList) {
            return CeylonIterable(jTypeConstraints.typeConstraints).collect(typeConstraintToCeylon);
        } else {
            return [];
        }
    }
    value annotations {
        if (exists jAnnotations = classAliasDefinition.annotationList) {
            return annotationsToCeylon(jAnnotations);
        } else {
            return Annotations();
        }
    }
};

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

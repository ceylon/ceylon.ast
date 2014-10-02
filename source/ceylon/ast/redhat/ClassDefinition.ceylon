import ceylon.ast.core {
    Annotations,
    ClassDefinition
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
shared ClassDefinition classDefinitionToCeylon(JClassDefinition classDefinition)
        => ClassDefinition {
    name = uIdentifierToCeylon(classDefinition.identifier);
    parameters = parametersToCeylon(classDefinition.parameterList);
    body = classBodyToCeylon(classDefinition.classBody);
    value caseTypes {
        if (exists jCaseTypes = classDefinition.caseTypes) {
            return caseTypesToCeylon(jCaseTypes);
        } else {
            return null;
        }
    }
    value extendedType {
        if (exists jExtendedType = classDefinition.extendedType) {
            return extendedTypeToCeylon(jExtendedType);
        } else {
            return null;
        }
    }
    value satisfiedTypes {
        if (exists jSatisfiedTypes = classDefinition.satisfiedTypes) {
            return satisfiedTypesToCeylon(jSatisfiedTypes);
        } else {
            return null;
        }
    }
    value typeParameters {
        if (exists jTypeParameters = classDefinition.typeParameterList) {
            return typeParametersToCeylon(jTypeParameters);
        } else {
            return null;
        }
    }
    value typeConstraints {
        if (exists jTypeConstraints = classDefinition.typeConstraintList) {
            return CeylonIterable(jTypeConstraints.typeConstraints).collect(typeConstraintToCeylon);
        } else {
            return [];
        }
    }
    value annotations {
        if (exists jAnnotations = classDefinition.annotationList) {
            return annotationsToCeylon(jAnnotations);
        } else {
            return Annotations();
        }
    }
};

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

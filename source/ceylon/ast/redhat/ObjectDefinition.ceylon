import ceylon.ast.core {
    ExtendedType,
    ObjectDefinition,
    SatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JObjectDefinition=ObjectDefinition
    }
}

"Converts a RedHat AST [[ObjectDefinition|JObjectDefinition]] to a `ceylon.ast` [[ObjectDefinition]]."
shared ObjectDefinition objectDefinitionToCeylon(JObjectDefinition objectDefinition) {
    ExtendedType? extendedType;
    if (exists jExtendedType = objectDefinition.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = objectDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    return ObjectDefinition {
        name = lIdentifierToCeylon(objectDefinition.identifier);
        body = classBodyToCeylon(objectDefinition.classBody);
        extendedType = extendedType;
        satisfiedTypes = satisfiedTypes;
        annotations = annotationsToCeylon(objectDefinition.annotationList);
    };
}

"Compiles the given [[code]] for an Object Definition
 into an [[ObjectDefinition]] using the Ceylon compiler
 (more specifically, the rule for an `declaration`)."
shared ObjectDefinition? compileObjectDefinition(String code) {
    if (is JObjectDefinition jDeclaration = createParser(code).declaration()) {
        return objectDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}

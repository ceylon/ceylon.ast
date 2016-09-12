import ceylon.ast.core {
    ExtendedType,
    Node,
    ObjectDefinition,
    SatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JObjectDefinition=ObjectDefinition
    }
}

"Converts a RedHat AST [[ObjectDefinition|JObjectDefinition]] to a `ceylon.ast` [[ObjectDefinition]]."
shared ObjectDefinition objectDefinitionToCeylon(JObjectDefinition objectDefinition, Anything(JNode,Node) update = noop) {
    ExtendedType? extendedType;
    if (exists jExtendedType = objectDefinition.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType, update);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = objectDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes, update);
    } else {
        satisfiedTypes = null;
    }
    value result = ObjectDefinition {
        name = lIdentifierToCeylon(objectDefinition.identifier, update);
        body = classBodyToCeylon(objectDefinition.classBody, update);
        extendedType = extendedType;
        satisfiedTypes = satisfiedTypes;
        annotations = annotationsToCeylon(objectDefinition.annotationList, update);
    };
    update(objectDefinition, result);
    return result;
}

"Parses the given [[code]] for an Object Definition
 into an [[ObjectDefinition]] using the Ceylon compiler
 (more specifically, the rule for an `declaration`)."
shared ObjectDefinition? parseObjectDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JObjectDefinition jDeclaration = createParser(code).declaration()) {
        return objectDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

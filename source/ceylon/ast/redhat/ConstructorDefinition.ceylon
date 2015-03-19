import ceylon.ast.core {
    ConstructorDefinition,
    ExtendedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConstructor=Constructor
    }
}

"Converts a RedHat AST [[Constructor|JConstructor]] to a `ceylon.ast` [[ConstructorDefinition]]."
shared ConstructorDefinition constructorDefinitionToCeylon(JConstructor constructorDefinition)
        => ConstructorDefinition {
    name = if (exists id = constructorDefinition.identifier) then uIdentifierToCeylon(id) else null;
    parameters = parametersToCeylon(constructorDefinition.parameterList);
    block = blockToCeylon(constructorDefinition.block);
    value extendedType {
        if (exists jExtendedType = constructorDefinition.delegatedConstructor) {
            return ExtendedType(classInstantiationToCeylon(jExtendedType.type, jExtendedType.invocationExpression));
        } else {
            return null;
        }
    }
    annotations = annotationsToCeylon(constructorDefinition.annotationList);
};

"Compiles the given [[code]] for a Constructor Definition
 into a [[ConstructorDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ConstructorDefinition? compileConstructorDefinition(String code) {
    if (is JConstructor jConstructorDefinition = createParser(code).declaration()) {
        return constructorDefinitionToCeylon(jConstructorDefinition);
    } else {
        return null;
    }
}

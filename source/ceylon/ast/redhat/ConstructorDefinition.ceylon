import ceylon.ast.core {
    ConstructorDefinition,
    ExtendedType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JConstructor=Constructor
    }
}

"Converts a RedHat AST [[Constructor|JConstructor]] to a `ceylon.ast` [[ConstructorDefinition]]."
shared ConstructorDefinition constructorDefinitionToCeylon(JConstructor constructorDefinition, Anything(JNode,Node) update = noop) {
    value result = ConstructorDefinition {
        name = if (exists id = constructorDefinition.identifier) then lIdentifierToCeylon(id, update) else null;
        parameters = parametersToCeylon(constructorDefinition.parameterList, update);
        block = blockToCeylon(constructorDefinition.block, update);
        value extendedType {
            if (exists jExtendedType = constructorDefinition.delegatedConstructor) {
                value result = ExtendedType(classInstantiationToCeylon(jExtendedType.type, jExtendedType.invocationExpression, update));
                update(jExtendedType, result);
                return result;
            } else {
                return null;
            }
        }
        annotations = annotationsToCeylon(constructorDefinition.annotationList, update);
    };
    update(constructorDefinition, result);
    return result;
}

"Compiles the given [[code]] for a Constructor Definition
 into a [[ConstructorDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ConstructorDefinition? compileConstructorDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JConstructor jConstructorDefinition = createParser(code).declaration()) {
        return constructorDefinitionToCeylon(jConstructorDefinition, update);
    } else {
        return null;
    }
}

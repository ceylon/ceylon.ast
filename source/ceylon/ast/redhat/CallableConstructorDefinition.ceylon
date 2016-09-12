import ceylon.ast.core {
    CallableConstructorDefinition,
    ExtendedType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JConstructor=Constructor
    }
}

"Converts a RedHat AST [[Constructor|JConstructor]] to a `ceylon.ast` [[CallableConstructorDefinition]]."
shared CallableConstructorDefinition callableConstructorDefinitionToCeylon(JConstructor callableConstructorDefinition, Anything(JNode,Node) update = noop) {
    value result = CallableConstructorDefinition {
        name = if (exists id = callableConstructorDefinition.identifier) then lIdentifierToCeylon(id, update) else null;
        parameters = parametersToCeylon(callableConstructorDefinition.parameterList, update);
        block = blockToCeylon(callableConstructorDefinition.block, update);
        value extendedType {
            if (exists jExtendedType = callableConstructorDefinition.delegatedConstructor) {
                value result = ExtendedType(extensionOrConstructionToCeylon(jExtendedType.invocationExpression else jExtendedType.type, update));
                update(jExtendedType, result);
                return result;
            } else {
                return null;
            }
        }
        annotations = annotationsToCeylon(callableConstructorDefinition.annotationList, update);
    };
    update(callableConstructorDefinition, result);
    return result;
}

"Parses the given [[code]] for a Callable Constructor Definition
 into a [[CallableConstructorDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared CallableConstructorDefinition? parseCallableConstructorDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JConstructor jCallableConstructorDefinition = createParser(code).declaration()) {
        return callableConstructorDefinitionToCeylon(jCallableConstructorDefinition, update);
    } else {
        return null;
    }
}

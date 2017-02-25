import ceylon.ast.core {
    ValueConstructorDefinition,
    ExtendedType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEnumerated=Enumerated
    },
    JNode=Node
}

"Converts a RedHat AST [[Enumerated|JEnumerated]] to a `ceylon.ast` [[ValueConstructorDefinition]]."
shared ValueConstructorDefinition valueConstructorDefinitionToCeylon(JEnumerated valueConstructorDefinition, Anything(JNode, Node) update = noop) {
    value result = ValueConstructorDefinition {
        name = lIdentifierToCeylon(valueConstructorDefinition.identifier, update);
        block = blockToCeylon(valueConstructorDefinition.block, update);
        value extendedType {
            if (exists jExtendedType = valueConstructorDefinition.delegatedConstructor) {
                value result = ExtendedType(extensionOrConstructionToCeylon(jExtendedType.invocationExpression else jExtendedType.type, update));
                update(jExtendedType, result);
                return result;
            } else {
                return null;
            }
        }
        annotations = annotationsToCeylon(valueConstructorDefinition.annotationList, update);
    };
    update(valueConstructorDefinition, result);
    return result;
}

"Parses the given [[code]] for a Value Constructor Definition
 into a [[ValueConstructorDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueConstructorDefinition? parseValueConstructorDefinition(String code, Anything(JNode, Node) update = noop) {
    if (is JEnumerated jValueConstructorDefinition = createParser(code).declaration()) {
        return valueConstructorDefinitionToCeylon(jValueConstructorDefinition, update);
    } else {
        return null;
    }
}

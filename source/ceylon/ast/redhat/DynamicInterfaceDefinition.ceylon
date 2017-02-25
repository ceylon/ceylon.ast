import ceylon.ast.core {
    DynamicInterfaceDefinition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

"Converts a RedHat AST [[InterfaceDefinition|JInterfaceDefinition]] to a `ceylon.ast` [[DynamicInterfaceDefinition]]."
throws (`class AssertionError`, "If the interface is not [[dynamic|JInterfaceDefinition.dynamic]]")
shared DynamicInterfaceDefinition dynamicInterfaceDefinitionToCeylon(JInterfaceDefinition dynamicInterfaceDefinition, Anything(JNode, Node) update = noop) {
    "Must be dynamic"
    assert (dynamicInterfaceDefinition.\idynamic);
    assert (is DynamicInterfaceDefinition ret = anyInterfaceDefinitionToCeylon(dynamicInterfaceDefinition, update));
    value result = ret;
    update(dynamicInterfaceDefinition, result);
    return result;
}

"Parses the given [[code]] for a Dynamic Interface Definition
 into a [[DynamicInterfaceDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared DynamicInterfaceDefinition? parseDynamicInterfaceDefinition(String code, Anything(JNode, Node) update = noop) {
    if (is JInterfaceDefinition jDeclaration = createParser(code).declaration(),
        jDeclaration.\idynamic) {
        return dynamicInterfaceDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

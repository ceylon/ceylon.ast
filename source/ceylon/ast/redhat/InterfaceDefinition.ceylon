import ceylon.ast.core {
    InterfaceDefinition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

"Converts a RedHat AST [[InterfaceDefinition|JInterfaceDefinition]] to a `ceylon.ast` [[InterfaceDefinition]]."
throws (`class AssertionError`, "If the interface is [[dynamic|JInterfaceDefinition.dynamic]]")
shared InterfaceDefinition interfaceDefinitionToCeylon(JInterfaceDefinition interfaceDefinition, Anything(JNode,Node) update = noop) {
    "Must not be dynamic"
    assert (!interfaceDefinition.\idynamic);
    assert (is InterfaceDefinition ret = anyInterfaceDefinitionToCeylon(interfaceDefinition, update));
    value result = ret;
    update(interfaceDefinition, result);
    return result;
}

"Parses the given [[code]] for an Interface Definition
 into an [[InterfaceDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared InterfaceDefinition? parseInterfaceDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JInterfaceDefinition jDeclaration = createParser(code).declaration(),
        !jDeclaration.\idynamic) {
        return interfaceDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

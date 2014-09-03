import ceylon.ast.core {
    DynamicInterfaceDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

"Converts a RedHat AST [[InterfaceDefinition|JInterfaceDefinition]] to a `ceylon.ast` [[DynamicInterfaceDefinition]]."
throws (`class AssertionError`, "If the interface is not [[dynamic|JInterfaceDefinition.dynamic]]")
shared DynamicInterfaceDefinition dynamicInterfaceDefinitionToCeylon(JInterfaceDefinition dynamicInterfaceDefinition) {
    "Must be dynamic"
    assert (dynamicInterfaceDefinition.\idynamic);
    assert (is DynamicInterfaceDefinition ret = anyInterfaceDefinitionToCeylon(dynamicInterfaceDefinition));
    return ret;
}

"Compiles the given [[code]] for a Dynamic Interface Definition
 into a [[DynamicInterfaceDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared DynamicInterfaceDefinition? compileDynamicInterfaceDefinition(String code) {
    if (is JInterfaceDefinition jDeclaration = createParser(code).declaration(),
        jDeclaration.\idynamic) {
        return dynamicInterfaceDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}

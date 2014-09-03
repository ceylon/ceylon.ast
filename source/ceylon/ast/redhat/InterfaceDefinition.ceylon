import ceylon.ast.core {
    InterfaceDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

"Converts a RedHat AST [[InterfaceDefinition|JInterfaceDefinition]] to a `ceylon.ast` [[InterfaceDefinition]]."
throws (`class AssertionError`, "If the interface is [[dynamic|JInterfaceDefinition.dynamic]]")
shared InterfaceDefinition interfaceDefinitionToCeylon(JInterfaceDefinition interfaceDefinition) {
    "Must not be dynamic"
    assert (!interfaceDefinition.\idynamic);
    assert (is InterfaceDefinition ret = anyInterfaceDefinitionToCeylon(interfaceDefinition));
    return ret;
}

"Compiles the given [[code]] for an Interface Definition
 into an [[InterfaceDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared InterfaceDefinition? compileInterfaceDefinition(String code) {
    if (is JInterfaceDefinition jDeclaration = createParser(code).declaration(),
        !jDeclaration.\idynamic) {
        return interfaceDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}

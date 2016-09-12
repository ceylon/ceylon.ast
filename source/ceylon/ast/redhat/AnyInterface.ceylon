import ceylon.ast.core {
    AnyInterface,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnyInterface=AnyInterface,
        JInterfaceDeclaration=InterfaceDeclaration,
        JInterfaceDefinition=InterfaceDefinition
    }
}

"Converts a RedHat AST [[AnyInterface|JAnyInterface]] to a `ceylon.ast` [[AnyInterface]]."
shared AnyInterface anyInterfaceToCeylon(JAnyInterface anyInterface, Anything(JNode,Node) update = noop) {
    assert (is JInterfaceDefinition|JInterfaceDeclaration anyInterface);
    switch (anyInterface)
    case (is JInterfaceDefinition) { return anyInterfaceDefinitionToCeylon(anyInterface, update); }
    case (is JInterfaceDeclaration) { return interfaceAliasDefinitionToCeylon(anyInterface, update); }
}

"Parses the given [[code]] for Any Interface
 into an [[AnyInterface]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyInterface? parseAnyInterface(String code, Anything(JNode,Node) update = noop) {
    if (is JAnyInterface jDeclaration = createParser(code).declaration()) {
        return anyInterfaceToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

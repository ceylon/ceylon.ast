import ceylon.ast.core {
    AnyInterface
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyInterface=AnyInterface,
        JInterfaceDefinition=InterfaceDefinition
    }
}

"Converts a RedHat AST [[AnyInterface|JAnyInterface]] to a `ceylon.ast` [[AnyInterface]]."
shared AnyInterface anyInterfaceToCeylon(JAnyInterface anyInterface) {
    assert (is JInterfaceDefinition anyInterface);
    switch (anyInterface)
    case (is JInterfaceDefinition) { return anyInterfaceDefinitionToCeylon(anyInterface); }
}

"Compiles the given [[code]] for Any Interface
 into an [[AnyInterface]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyInterface? compileAnyInterface(String code) {
    if (is JAnyInterface jDeclaration = createParser(code).declaration()) {
        return anyInterfaceToCeylon(jDeclaration);
    } else {
        return null;
    }
}

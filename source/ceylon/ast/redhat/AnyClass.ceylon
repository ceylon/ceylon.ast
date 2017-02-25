import ceylon.ast.core {
    AnyClass,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnyClass=AnyClass,
        JClassDeclaration=ClassDeclaration,
        JClassDefinition=ClassDefinition
    }
}

"Converts a RedHat AST [[AnyClass|JAnyClass]] to a `ceylon.ast` [[AnyClass]]."
shared AnyClass anyClassToCeylon(JAnyClass anyClass, Anything(JNode, Node) update = noop) {
    assert (is JClassDefinition|JClassDeclaration anyClass);
    switch (anyClass)
    case (is JClassDefinition) { return classDefinitionToCeylon(anyClass, update); }
    case (is JClassDeclaration) { return classAliasDefinitionToCeylon(anyClass, update); }
}

"Parses the given [[code]] for Any Class
 into an [[AnyClass]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyClass? parseAnyClass(String code, Anything(JNode, Node) update = noop) {
    if (is JAnyClass jAnyClass = createParser(code).declaration()) {
        return anyClassToCeylon(jAnyClass, update);
    } else {
        return null;
    }
}

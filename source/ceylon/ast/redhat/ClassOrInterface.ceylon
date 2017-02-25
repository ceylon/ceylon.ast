import ceylon.ast.core {
    ClassOrInterface,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnyClass=AnyClass,
        JAnyInterface=AnyInterface,
        JClassOrInterface=ClassOrInterface
    }
}

"Converts a RedHat AST [[ClassOrInterface|JClassOrInterface]] to a `ceylon.ast` [[ClassOrInterface]]."
shared ClassOrInterface classOrInterfaceToCeylon(JClassOrInterface classOrInterface, Anything(JNode, Node) update = noop) {
    assert (is JAnyClass|JAnyInterface classOrInterface);
    switch (classOrInterface)
    case (is JAnyClass) { return anyClassToCeylon(classOrInterface, update); }
    case (is JAnyInterface) { return anyInterfaceToCeylon(classOrInterface, update); }
}

"Parses the given [[code]] for a Class Or Interface
 into a [[ClassOrInterface]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassOrInterface? parseClassOrInterface(String code, Anything(JNode, Node) update = noop) {
    if (is JClassOrInterface jDeclaration = createParser(code).declaration()) {
        return classOrInterfaceToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

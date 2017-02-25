import ceylon.ast.core {
    Node,
    TypeDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JClassOrInterface=ClassOrInterface,
        JTypeAliasDeclaration=TypeAliasDeclaration,
        JTypeDeclaration=TypeDeclaration
    }
}

"Converts a RedHat AST [[TypeDeclaration|JTypeDeclaration]] to a `ceylon.ast` [[TypeDeclaration]]."
shared TypeDeclaration typeDeclarationToCeylon(JTypeDeclaration typeDeclaration, Anything(JNode, Node) update = noop) {
    assert (is JClassOrInterface|JTypeAliasDeclaration typeDeclaration);
    switch (typeDeclaration)
    case (is JClassOrInterface) { return classOrInterfaceToCeylon(typeDeclaration, update); }
    case (is JTypeAliasDeclaration) { return typeAliasDefinitionToCeylon(typeDeclaration, update); }
}

"Parses the given [[code]] for a Type Declaration
 into a [[TypeDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared TypeDeclaration? parseTypeDeclaration(String code, Anything(JNode, Node) update = noop) {
    if (is JTypeDeclaration jDeclaration = createParser(code).declaration()) {
        return typeDeclarationToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

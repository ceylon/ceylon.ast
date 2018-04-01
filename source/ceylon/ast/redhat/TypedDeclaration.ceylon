import ceylon.ast.core {
    Node,
    TypedDeclaration
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnyAttribute=AnyAttribute,
        JAnyMethod=AnyMethod,
        JTypedDeclaration=TypedDeclaration
    }
}

"Converts a RedHat AST [[TypedDeclaration|JTypedDeclaration]] to a `ceylon.ast` [[TypedDeclaration]].
 
 (Warning: In the RedHat AST, [[ObjectDefinitions|org.eclipse.ceylon.compiler.typechecker.tree::Tree.ObjectDefinition]]
 and [[AttributeSetterDefinitions|org.eclipse.ceylon.compiler.typechecker.tree::Tree.AttributeSetterDefinition]]
 are typed declarations; however, this is not the case in `ceylon.ast`, and this function
 will not accept them.)"
shared TypedDeclaration typedDeclarationToCeylon(JTypedDeclaration typedDeclaration, Anything(JNode, Node) update = noop) {
    assert (is JAnyAttribute|JAnyMethod typedDeclaration);
    switch (typedDeclaration)
    case (is JAnyAttribute) { return anyValueToCeylon(typedDeclaration, update); }
    case (is JAnyMethod) { return anyFunctionToCeylon(typedDeclaration, update); }
}

"Parses the given [[code]] for a Typed Declaration
 into a [[TypedDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared TypedDeclaration? parseTypedDeclaration(String code, Anything(JNode, Node) update = noop) {
    if (is JTypedDeclaration jDeclaration = createParser(code).declaration()) {
        return typedDeclarationToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}

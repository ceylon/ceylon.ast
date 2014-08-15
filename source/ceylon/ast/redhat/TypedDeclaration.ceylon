import ceylon.ast.core {
    TypedDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute,
        JAnyMethod=AnyMethod,
        JTypedDeclaration=TypedDeclaration
    }
}

"Converts a RedHat AST [[TypedDeclaration|JTypedDeclaration]] to a `ceylon.ast` [[TypedDeclaration]].
 
 (Warning: In the RedHat AST, [[ObjectDefinitions|com.redhat.ceylon.compiler.typechecker.tree::Tree.ObjectDefinition]]
 are typed declarations; however, this is not the case in `ceylon.ast`, and this function
 will not accept them.)"
shared TypedDeclaration typedDeclarationToCeylon(JTypedDeclaration typedDeclaration) {
    assert (is JAnyAttribute|JAnyMethod typedDeclaration);
    switch (typedDeclaration)
    case (is JAnyAttribute) { return anyValueToCeylon(typedDeclaration); }
    case (is JAnyMethod) { return anyFunctionToCeylon(typedDeclaration); }
}

"Compiles the given [[code]] for a Typed Declaration
 into a [[TypedDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared TypedDeclaration? compileTypedDeclaration(String code) {
    if (is JTypedDeclaration jDeclaration = createParser(code).declaration()) {
        return typedDeclarationToCeylon(jDeclaration);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    TypedDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute,
        JTypedDeclaration=TypedDeclaration
    }
}

"Converts a RedHat AST [[TypedDeclaration|JTypedDeclaration]] to a `ceylon.ast` [[TypedDeclaration]]."
shared TypedDeclaration typedDeclarationToCeylon(JTypedDeclaration typedDeclaration) {
    assert (is JAnyAttribute typedDeclaration);
    switch (typedDeclaration)
    case (is JAnyAttribute) { return anyAttributeToCeylon(typedDeclaration); }
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

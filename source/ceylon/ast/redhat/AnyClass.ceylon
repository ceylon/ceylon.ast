import ceylon.ast.core {
    AnyClass
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyClass=AnyClass,
        JClassDeclaration=ClassDeclaration,
        JClassDefinition=ClassDefinition
    }
}

"Converts a RedHat AST [[AnyClass|JAnyClass]] to a `ceylon.ast` [[AnyClass]]."
shared AnyClass anyClassToCeylon(JAnyClass anyClass) {
    assert (is JClassDefinition|JClassDeclaration anyClass);
    switch (anyClass)
    case (is JClassDefinition) { return classDefinitionToCeylon(anyClass); }
    case (is JClassDeclaration) { return classAliasToCeylon(anyClass); }
}

"Compiles the given [[code]] for Any Class
 into an [[AnyClass]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyClass? compileAnyClass(String code) {
    if (is JAnyClass jAnyClass = createParser(code).declaration()) {
        return anyClassToCeylon(jAnyClass);
    } else {
        return null;
    }
}

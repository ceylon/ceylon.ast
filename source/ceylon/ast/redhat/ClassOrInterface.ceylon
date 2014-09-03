import ceylon.ast.core {
    ClassOrInterface
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyClass=AnyClass,
        JAnyInterface=AnyInterface,
        JClassOrInterface=ClassOrInterface
    }
}

"Converts a RedHat AST [[ClassOrInterface|JClassOrInterface]] to a `ceylon.ast` [[ClassOrInterface]]."
shared ClassOrInterface classOrInterfaceToCeylon(JClassOrInterface classOrInterface) {
    assert (is JAnyClass|JAnyInterface classOrInterface);
    switch (classOrInterface)
    case (is JAnyClass) { return anyClassToCeylon(classOrInterface); }
    case (is JAnyInterface) { return anyInterfaceToCeylon(classOrInterface); }
}

"Compiles the given [[code]] for a Class Or Interface
 into a [[ClassOrInterface]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassOrInterface? compileClassOrInterface(String code) {
    if (is JClassOrInterface jDeclaration = createParser(code).declaration()) {
        return classOrInterfaceToCeylon(jDeclaration);
    } else {
        return null;
    }
}

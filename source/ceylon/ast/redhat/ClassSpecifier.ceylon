import ceylon.ast.core {
    ClassSpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassSpecifier=ClassSpecifier
    }
}

"Converts a RedHat AST [[ClassSpecifier|JClassSpecifier]] to a `ceylon.ast` [[ClassSpecifier]]."
shared ClassSpecifier classSpecifierToCeylon(JClassSpecifier classSpecifier) {
    return ClassSpecifier(classInstantiationToCeylon(classSpecifier.type, classSpecifier.invocationExpression));
}

"Compiles the given [[code]] for a Class Specifier
 into a [[ClassSpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `classSpecifier`)."
shared ClassSpecifier? compileClassSpecifier(String code) {
    if (exists jClassSpecifier = createParser(code).classSpecifier()) {
        return classSpecifierToCeylon(jClassSpecifier);
    } else {
        return null;
    }
}

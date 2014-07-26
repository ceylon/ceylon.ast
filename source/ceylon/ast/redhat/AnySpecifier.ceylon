import ceylon.ast.core {
    AnySpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JSpecifierExpression=SpecifierExpression
    }
}

"Converts a RedHat AST [[SpecifierExpression|JSpecifierExpression]] to a `ceylon.ast` [[AnySpecifier]]."
shared AnySpecifier anySpecifierToCeylon(JSpecifierExpression anySpecifier) {
    if (is JLazySpecifierExpression anySpecifier) {
        return lazySpecifierToCeylon(anySpecifier);
    } else {
        return specifierToCeylon(anySpecifier);
    }
}

"Compiles the given [[code]] for an Any Specifier
 into an [[AnySpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `specifier` or `lazySpecifier`)."
shared AnySpecifier? compileAnySpecifier(String code) {
    if (exists jSpecifier = createParser(code).specifier()) {
        return anySpecifierToCeylon(jSpecifier);
    } else if (exists jLazySpecifier = createParser(code).lazySpecifier()) {
        return anySpecifierToCeylon(jLazySpecifier);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    AnySpecifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JSpecifierExpression=SpecifierExpression
    }
}

"Converts a RedHat AST [[SpecifierExpression|JSpecifierExpression]] to a `ceylon.ast` [[AnySpecifier]]."
shared AnySpecifier anySpecifierToCeylon(JSpecifierExpression anySpecifier, Anything(JNode, Node) update = noop) {
    AnySpecifier result;
    if (is JLazySpecifierExpression anySpecifier) {
        result = lazySpecifierToCeylon(anySpecifier, update);
    } else {
        result = specifierToCeylon(anySpecifier, update);
    }
    update(anySpecifier, result);
    return result;
}

"Parses the given [[code]] for an Any Specifier
 into an [[AnySpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `specifier` or `lazySpecifier`)."
shared AnySpecifier? parseAnySpecifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jSpecifier = createParser(code).specifier()) {
        return anySpecifierToCeylon(jSpecifier, update);
    } else if (exists jLazySpecifier = createParser(code).lazySpecifier()) {
        return anySpecifierToCeylon(jLazySpecifier, update);
    } else {
        return null;
    }
}

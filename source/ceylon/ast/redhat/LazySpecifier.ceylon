import ceylon.ast.core {
    LazySpecifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JParExpression=ParExpression
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        compute=\iCOMPUTE
    }
}

"Converts a RedHat AST [[LazySpecifierExpression|JLazySpecifierExpression]] to a `ceylon.ast` [[LazySpecifier]]."
shared LazySpecifier lazySpecifierToCeylon(JLazySpecifierExpression lazySpecifier, Anything(JNode, Node) update = noop) {
    "Must be a “wrapper” Expression, not a grouping Expression"
    assert (!lazySpecifier.expression is JParExpression);
    "Must be a true lazy specifier"
    // The grammar rule functionSpecifier allows '= expression' and proceeds to create a LazySpecifierExpression($SPECIFY). madness
    assert (lazySpecifier.mainToken.type == compute);
    value result = LazySpecifier(expressionToCeylon(lazySpecifier.expression.term, update));
    update(lazySpecifier, result);
    return result;
}

"Parses the given [[code]] for a Lazy Specifier
 into a [[LazySpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `lazySpecifier`)."
shared LazySpecifier? parseLazySpecifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jLazySpecifier = createParser(code).lazySpecifier()) {
        "The grammar rule declares only SpecifierExpression, but will always return LazySpecifierExpression"
        assert (is JLazySpecifierExpression jLazySpecifier);
        return lazySpecifierToCeylon(jLazySpecifier, update);
    } else {
        return null;
    }
}

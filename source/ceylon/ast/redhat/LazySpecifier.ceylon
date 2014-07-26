import ceylon.ast.core {
    LazySpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        compute=\iCOMPUTE
    }
}

"Converts a RedHat AST [[LazySpecifierExpression|JLazySpecifierExpression]] to a `ceylon.ast` [[LazySpecifier]]."
shared LazySpecifier lazySpecifierToCeylon(JLazySpecifierExpression lazySpecifier) {
    "Must be a “wrapper” Expression, not a grouping Expression"
    assert (!lazySpecifier.expression.mainToken exists);
    "Must be a true lazy specifier"
    // The grammar rule functionSpecifier allows '= expression' and proceeds to create a LazySpecifierExpression($SPECIFY). madness
    assert (lazySpecifier.mainToken.type == compute);
    return LazySpecifier(expressionToCeylon(lazySpecifier.expression.term));
}

"Compiles the given [[code]] for a Lazy Specifier
 into a [[LazySpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `lazySpecifier`)."
shared LazySpecifier? compileLazySpecifier(String code) {
    if (exists jLazySpecifier = createParser(code).lazySpecifier()) {
        "The grammar rule declares only SpecifierExpression, but will always return LazySpecifierExpression"
        assert (is JLazySpecifierExpression jLazySpecifier);
        return lazySpecifierToCeylon(jLazySpecifier);
    } else {
        return null;
    }
}

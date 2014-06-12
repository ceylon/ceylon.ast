import ceylon.ast.api {
    IntegerLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntegerLiteral=NaturalLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        naturalLiteral=\iNATURAL_LITERAL
    }
}

"Converts a RedHat AST [[NaturalLiteral|JIntegerLiteral]] to a `ceylon.ast` [[IntegerLiteral]]."
throws (`class AssertionError`, "If the token type is not `NATURAL_LITERAL`.")
shared IntegerLiteral integerLiteralToCeylon(JIntegerLiteral integerLiteral) {
    assert (integerLiteral.mainToken.type == naturalLiteral);
    return IntegerLiteral(integerLiteral.text);
}

"Compiles the given [[code]] for an Integer Literal
 into an [[IntegerLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `nonstringLiteral`)."
shared IntegerLiteral? compileIntegerLiteral(String code) {
    if (is JIntegerLiteral jIntegerLiteral = createParser(code).nonstringLiteral()) {
        return integerLiteralToCeylon(jIntegerLiteral);
    } else {
        return null;
    }
}

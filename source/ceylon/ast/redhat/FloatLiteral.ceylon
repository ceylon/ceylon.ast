import ceylon.ast.api {
    FloatLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFloatLiteral=FloatLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        float_literal=\iFLOAT_LITERAL
    }
}

"Converts a RedHat AST [[FloatLiteral|JFloatLiteral]] to a `ceylon.ast` [[FloatLiteral]]."
throws (`class AssertionError`, "If the token type is not `FLOAT_LITERAL`.")
shared FloatLiteral floatLiteralToCeylon(JFloatLiteral floatLiteral) {
    assert (floatLiteral.mainToken.type == float_literal);
    return FloatLiteral(floatLiteral.text);
}

"Compiles the given [[code]] for a Float Literal
 into a [[FloatLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `nonStringLiteral`)."
shared FloatLiteral? compileFloatLiteral(String code) {
    if (is JFloatLiteral jFloatLiteral = createParser(code).nonstringLiteral()) {
        return floatLiteralToCeylon(jFloatLiteral);
    } else {
        return null;
    }
}

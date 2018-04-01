import ceylon.ast.core {
    FloatLiteral,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFloatLiteral=FloatLiteral
    }
}
import org.eclipse.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        float_literal=\iFLOAT_LITERAL
    }
}

"Converts a RedHat AST [[FloatLiteral|JFloatLiteral]] to a `ceylon.ast` [[FloatLiteral]]."
throws (`class AssertionError`, "If the token type is not `FLOAT_LITERAL`.")
shared FloatLiteral floatLiteralToCeylon(JFloatLiteral floatLiteral, Anything(JNode, Node) update = noop) {
    assert (floatLiteral.mainToken.type == float_literal);
    value result = FloatLiteral(floatLiteral.mainToken.text);
    update(floatLiteral, result);
    return result;
}

"Parses the given [[code]] for a Float Literal
 into a [[FloatLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `nonStringLiteral`)."
shared FloatLiteral? parseFloatLiteral(String code, Anything(JNode, Node) update = noop) {
    if (is JFloatLiteral jFloatLiteral = createParser(code).nonstringLiteral()) {
        return floatLiteralToCeylon(jFloatLiteral, update);
    } else {
        return null;
    }
}

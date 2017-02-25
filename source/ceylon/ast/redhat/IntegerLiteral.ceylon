import ceylon.ast.core {
    IntegerLiteral,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared IntegerLiteral integerLiteralToCeylon(JIntegerLiteral integerLiteral, Anything(JNode, Node) update = noop) {
    assert (integerLiteral.mainToken.type == naturalLiteral);
    value result = IntegerLiteral(integerLiteral.mainToken.text);
    update(integerLiteral, result);
    return result;
}

"Parses the given [[code]] for an Integer Literal
 into an [[IntegerLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `nonstringLiteral`)."
shared IntegerLiteral? parseIntegerLiteral(String code, Anything(JNode, Node) update = noop) {
    if (is JIntegerLiteral jIntegerLiteral = createParser(code).nonstringLiteral()) {
        return integerLiteralToCeylon(jIntegerLiteral, update);
    } else {
        return null;
    }
}

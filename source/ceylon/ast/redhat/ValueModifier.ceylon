import ceylon.ast.core {
    Node,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JValueModifier=ValueModifier
    }
}
import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream,
    Token
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        valueType=\iVALUE_MODIFIER
    }
}

"Converts a RedHat AST [[ValueModifier|JValueModifier]] to a `ceylon.ast` [[ValueModifier]]."
shared ValueModifier valueModifierToCeylon(JValueModifier valueModifier, Anything(JNode,Node) update = noop) {
    value result = ValueModifier();
    update(valueModifier, result);
    return result;
}

"Parses the given [[code]] for a Value Modifier
 into a [[ValueModifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared ValueModifier? parseValueModifier(String code, Anything(JNode,Node) update = noop) {
    value stream = CommonTokenStream(CeylonLexer(ANTLRStringStream(code + " ")));
    Token? token = stream.\iLT(1);
    if (exists token, token.type == valueType) {
        value jValueModifier = JValueModifier(token);
        value result = ValueModifier();
        update(jValueModifier, result);
        return result;
    } else {
        return null;
    }
}

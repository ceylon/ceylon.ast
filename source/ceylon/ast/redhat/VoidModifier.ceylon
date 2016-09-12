import ceylon.ast.core {
    Node,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JVoidModifier=VoidModifier
    }
}
import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream,
    Token
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        voidType=\iVOID_MODIFIER
    }
}

"Converts a RedHat AST [[VoidModifier|JVoidModifier]] to a `ceylon.ast` [[VoidModifier]]."
shared VoidModifier voidModifierToCeylon(JVoidModifier voidModifier, Anything(JNode,Node) update = noop) {
    value result = VoidModifier();
    update(voidModifier, result);
    return result;
}

"Parses the given [[code]] for a Void Modifier
 into a [[VoidModifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared VoidModifier? parseVoidModifier(String code, Anything(JNode,Node) update = noop) {
    value stream = CommonTokenStream(CeylonLexer(ANTLRStringStream(code + " ")));
    Token? token = stream.\iLT(1);
    if (exists token, token.type == voidType) {
        value jVoidModifier = JVoidModifier(token);
        value result = VoidModifier();
        update(jVoidModifier, result);
        return result;
    } else {
        return null;
    }
}

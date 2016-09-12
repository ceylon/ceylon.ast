import ceylon.ast.core {
    DynamicModifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier
    }
}
import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream,
    Token
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        dynamicType=\iDYNAMIC
    }
}

"Converts a RedHat AST [[DynamicModifier|JDynamicModifier]] to a `ceylon.ast` [[DynamicModifier]]."
shared DynamicModifier dynamicModifierToCeylon(JDynamicModifier dynamicModifier, Anything(JNode,Node) update = noop) {
    value result = DynamicModifier();
    update(dynamicModifier, result);
    return result;
}

"Parses the given [[code]] for a Dynamic Modifier
 into a [[DynamicModifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared DynamicModifier? parseDynamicModifier(String code, Anything(JNode,Node) update = noop) {
    value stream = CommonTokenStream(CeylonLexer(ANTLRStringStream(code + " ")));
    Token? token = stream.\iLT(1);
    if (exists token, token.type == dynamicType) {
        value jDynamicModifier = JDynamicModifier(token);
        value result = DynamicModifier();
        update(jDynamicModifier, result);
        return result;
    } else {
        return null;
    }
}

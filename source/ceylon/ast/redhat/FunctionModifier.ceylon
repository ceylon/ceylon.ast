import ceylon.ast.core {
    FunctionModifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionModifier=FunctionModifier
    }
}
import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream,
    Token
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        functionType=\iFUNCTION_MODIFIER
    }
}

"Converts a RedHat AST [[FunctionModifier|JFunctionModifier]] to a `ceylon.ast` [[FunctionModifier]]."
shared FunctionModifier functionModifierToCeylon(JFunctionModifier functionModifier, Anything(JNode,Node) update = noop) {
    value result = FunctionModifier();
    update(functionModifier, result);
    return result;
}

"Compiles the given [[code]] for a Function Modifier
 into a [[FunctionModifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared FunctionModifier? compileFunctionModifier(String code, Anything(JNode,Node) update = noop) {
    value stream = CommonTokenStream(CeylonLexer(ANTLRStringStream(code + " ")));
    Token? token = stream.\iLT(1);
    if (exists token, token.type == functionType) {
        value jFunctionModifier = JFunctionModifier(token);
        value result = FunctionModifier();
        update(jFunctionModifier, result);
        return result;
    } else {
        return null;
    }
}

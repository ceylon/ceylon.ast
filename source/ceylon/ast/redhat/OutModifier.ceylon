import ceylon.ast.core {
    Node,
    OutModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTypeVariance=TypeVariance
    }
}
import org.eclipse.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        outType=\iOUT
    }
}

"Converts a RedHat AST [[TypeVariance|JTypeVariance]]
 with token type [[`OUT`|outType]]
 to a `ceylon.ast` [[OutModifier]]."
shared OutModifier outModifierToCeylon(JTypeVariance outModifier, Anything(JNode, Node) update = noop) {
    "Must be an ‘in’ modifier"
    assert (outModifier.mainToken.type == outType);
    value result = OutModifier();
    update(outModifier, result);
    return result;
}

"Parses the given [[code]] for an Out Modifier
 into an [[OutModifier]] using the Ceylon compiler
 (more specifically, the rule for a `variance`)."
shared OutModifier? parseOutModifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jVariance = createParser(code).variance(),
        jVariance.mainToken.type == outType) {
        return outModifierToCeylon(jVariance, update);
    } else {
        return null;
    }
}

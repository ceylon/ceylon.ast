import ceylon.ast.core {
    OutModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeVariance=TypeVariance
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        outType=\iOUT
    }
}

"Converts a RedHat AST [[TypeVariance|JTypeVariance]]
 with token type [[`OUT`|outType]]
 to a `ceylon.ast` [[OutModifier]]."
shared OutModifier outModifierToCeylon(JTypeVariance outModifier) {
    "Must be an ‘in’ modifier"
    assert (outModifier.mainToken.type == outType);
    return OutModifier();
}

"Compiles the given [[code]] for an Out Modifier
 into an [[OutModifier]] using the Ceylon compiler
 (more specifically, the rule for a `variance`)."
shared OutModifier? compileOutModifier(String code) {
    if (exists jVariance = createParser(code).variance(),
        jVariance.mainToken.type == outType) {
        return outModifierToCeylon(jVariance);
    } else {
        return null;
    }
}

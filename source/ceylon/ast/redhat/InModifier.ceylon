import ceylon.ast.core {
    InModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeVariance=TypeVariance
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        in_op=\iIN_OP
    }
}

"Converts a RedHat AST [[TypeVariance|JTypeVariance]]
 with token type [[`IN_OP`|in_op]]
 to a `ceylon.ast` [[InModifier]]."
shared InModifier inModifierToCeylon(JTypeVariance inModifier) {
    "Must be an ‘in’ modifier"
    assert (inModifier.mainToken.type == in_op);
    return InModifier();
}

"Compiles the given [[code]] for an In Modifier
 into an [[InModifier]] using the Ceylon compiler
 (more specifically, the rule for a `variance`)."
shared InModifier? compileInModifier(String code) {
    if (exists jVariance = createParser(code).variance(),
        jVariance.mainToken.type == in_op) {
        return inModifierToCeylon(jVariance);
    } else {
        return null;
    }
}

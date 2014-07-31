import ceylon.ast.core {
    Variance
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

"Converts a RedHat AST [[TypeVariance|JTypeVariance]] to a `ceylon.ast` [[Variance]]."
shared Variance varianceToCeylon(JTypeVariance variance) {
    value type = variance.mainToken.type;
    if (type == in_op) {
        return inModifierToCeylon(variance);
    } else {
        return outModifierToCeylon(variance);
    }
}

"Compiles the given [[code]] for a Variance
 into a [[Variance]] using the Ceylon compiler
 (more specifically, the rule for a `variance`)."
shared Variance? compileVariance(String code) {
    if (exists jVariance = createParser(code).variance()) {
        return varianceToCeylon(jVariance);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Node,
    Variance
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared Variance varianceToCeylon(JTypeVariance variance, Anything(JNode, Node) update = noop) {
    value type = variance.mainToken.type;
    if (type == in_op) {
        return inModifierToCeylon(variance, update);
    } else {
        return outModifierToCeylon(variance, update);
    }
}

"Parses the given [[code]] for a Variance
 into a [[Variance]] using the Ceylon compiler
 (more specifically, the rule for a `variance`)."
shared Variance? parseVariance(String code, Anything(JNode, Node) update = noop) {
    if (exists jVariance = createParser(code).variance()) {
        return varianceToCeylon(jVariance, update);
    } else {
        return null;
    }
}

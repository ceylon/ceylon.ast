import ceylon.ast.core {
    Comprehension,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JComprehension=Comprehension
    }
}

"Converts a RedHat AST [[Comprehension|JComprehension]] to a `ceylon.ast` [[Comprehension]]."
shared Comprehension comprehensionToCeylon(JComprehension comprehension, Anything(JNode,Node) update = noop) {
    value result = Comprehension(initialComprehensionClauseToCeylon(comprehension.initialComprehensionClause, update));
    update(comprehension, result);
    return result;
}

"Parses the given [[code]] for a Comprehension
 into a [[Comprehension]] using the Ceylon compiler
 (more specifically, the rule for a `comprehension`)."
shared Comprehension? parseComprehension(String code, Anything(JNode,Node) update = noop) {
    if (exists jComprehension = createParser(code).comprehension()) {
        return comprehensionToCeylon(jComprehension, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Assertion,
    Annotations,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAssertion=Assertion
    }
}

"Converts a RedHat AST [[Assertion|JAssertion]] to a `ceylon.ast` [[Assertion]]."
shared Assertion assertionToCeylon(JAssertion assertion, Anything(JNode,Node) update = noop) {
    Annotations annotations;
    if (exists jAnnotations = assertion.annotationList) {
        annotations = annotationsToCeylon(jAnnotations, update);
    } else {
        annotations = Annotations();
    }
    value result = Assertion(conditionsToCeylon(assertion.conditionList, update), annotations);
    update(assertion, result);
    return result;
}

"Compiles the given [[code]] for an Assertion
 into an [[Assertion]] using the Ceylon compiler
 (more specifically, the rule for an `assertion`)."
shared Assertion? compileAssertion(String code, Anything(JNode,Node) update = noop) {
    if (exists jAssertion = createParser(code).assertion()) {
        return assertionToCeylon(jAssertion, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Assertion,
    Annotations
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssertion=Assertion
    }
}

"Converts a RedHat AST [[Assertion|JAssertion]] to a `ceylon.ast` [[Assertion]]."
shared Assertion assertionToCeylon(JAssertion assertion) {
    Annotations annotations;
    if (exists jAnnotations = assertion.annotationList) {
        annotations = annotationsToCeylon(jAnnotations);
    } else {
        annotations = Annotations();
    }
    return Assertion(conditionListToCeylon(assertion.conditionList), annotations);
}

"Compiles the given [[code]] for an Assertion
 into an [[Assertion]] using the Ceylon compiler
 (more specifically, the rule for an `assertion`)."
shared Assertion? compileAssertion(String code) {
    if (exists jAssertion = createParser(code).assertion()) {
        return assertionToCeylon(jAssertion);
    } else {
        return null;
    }
}

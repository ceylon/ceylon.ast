import ceylon.ast.core {
    Assertion,
    AssertionMessage,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAssertion=Assertion
    }
}

"Converts a RedHat AST [[Assertion|JAssertion]] to a `ceylon.ast` [[Assertion]]."
shared Assertion assertionToCeylon(JAssertion assertion, Anything(JNode, Node) update = noop) {
    AssertionMessage? message;
    if (exists jAnnotations = assertion.annotationList) {
        "Assertion cannot have regular annotations"
        assert (jAnnotations.annotations.empty);
        if (exists jAnonymousAnnotation = jAnnotations.anonymousAnnotation) {
            if (exists jStringLiteral = jAnonymousAnnotation.stringLiteral) {
                "Anonymous annotation cannot have both string literal and string template"
                assert (!jAnonymousAnnotation.stringTemplate exists);
                message = stringLiteralToCeylon(jStringLiteral, update);
            } else {
                "Anonymous annotation must have either string literal or string template"
                assert (exists jStringTemplate = jAnonymousAnnotation.stringTemplate);
                message = stringTemplateToCeylon(jStringTemplate, update);
            }
        } else {
            message = null;
        }
    } else {
        message = null;
    }
    value result = Assertion(conditionsToCeylon(assertion.conditionList, update), message);
    update(assertion, result);
    return result;
}

"Parses the given [[code]] for an Assertion
 into an [[Assertion]] using the Ceylon compiler
 (more specifically, the rule for an `assertion`)."
shared Assertion? parseAssertion(String code, Anything(JNode, Node) update = noop) {
    if (exists jAssertion = createParser(code).assertion()) {
        return assertionToCeylon(jAssertion, update);
    } else {
        return null;
    }
}

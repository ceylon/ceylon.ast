import ceylon.ast.core {
    Continue,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JContinue=Continue
    }
}

"Converts a RedHat AST [[Continue|JContinue]] to a `ceylon.ast` [[Continue]]."
shared Continue continueToCeylon(JContinue \icontinue, Anything(JNode, Node) update = noop) {
    value result = Continue();
    update(\icontinue, result);
    return result;
}

"Parses the given [[code]] for a Continue
 into a [[Continue]] using the Ceylon compiler
 (more specifically, the rule for a `continue`)."
shared Continue? parseContinue(String code, Anything(JNode, Node) update = noop) {
    if (is JContinue jDirectiveStatement = createParser(code).directiveStatement()) {
        // continueDirective doesn’t contain the semicolon
        return continueToCeylon(jDirectiveStatement, update);
    } else {
        return null;
    }
}

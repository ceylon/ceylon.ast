import ceylon.ast.core {
    Continue
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JContinue=Continue
    }
}

"Converts a RedHat AST [[Continue|JContinue]] to a `ceylon.ast` [[Continue]]."
shared Continue continueToCeylon(JContinue \icontinue) {
    return Continue();
}

"Compiles the given [[code]] for a Continue
 into a [[Continue]] using the Ceylon compiler
 (more specifically, the rule for a `continue`)."
shared Continue? compileContinue(String code) {
    if (is JContinue jDirectiveStatement = createParser(code).directiveStatement()) {
        // continueDirective doesn’t contain the semicolon
        return continueToCeylon(jDirectiveStatement);
    } else {
        return null;
    }
}

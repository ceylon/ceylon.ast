import ceylon.ast.core {
    Return
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JReturn=Return
    }
}

"Converts a RedHat AST [[Return|JReturn]] to a `ceylon.ast` [[Return]]."
shared Return returnToCeylon(JReturn \ireturn) {
    if (exists expression = \ireturn.expression) {
        return Return(expressionToCeylon(expression));
    } else {
        return Return();
    }
}

"Compiles the given [[code]] for a Return
 into a [[Return]] using the Ceylon compiler
 (more specifically, the rule for a `return`)."
shared Return? compileReturn(String code) {
    if (is JReturn jDirectiveStatement = createParser(code).directiveStatement()) {
        // returnDirective doesn’t contain the semicolon
        return returnToCeylon(jDirectiveStatement);
    } else {
        return null;
    }
}

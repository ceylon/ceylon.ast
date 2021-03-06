import ceylon.ast.core {
    Node,
    Return
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JReturn=Return
    }
}

"Converts a RedHat AST [[Return|JReturn]] to a `ceylon.ast` [[Return]]."
shared Return returnToCeylon(JReturn \ireturn, Anything(JNode, Node) update = noop) {
    Return result;
    if (exists expression = \ireturn.expression) {
        result = Return(expressionToCeylon(expression, update));
    } else {
        result = Return();
    }
    update(\ireturn, result);
    return result;
}

"Parses the given [[code]] for a Return
 into a [[Return]] using the Ceylon compiler
 (more specifically, the rule for a `return`)."
shared Return? parseReturn(String code, Anything(JNode, Node) update = noop) {
    if (is JReturn jDirectiveStatement = createParser(code).directiveStatement()) {
        // returnDirective doesn’t contain the semicolon
        return returnToCeylon(jDirectiveStatement, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Node,
    Throw
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JThrow=Throw
    }
}

"Converts a RedHat AST [[Throw|JThrow]] to a `ceylon.ast` [[Throw]]."
shared Throw throwToCeylon(JThrow \ithrow, Anything(JNode,Node) update = noop) {
    Throw result;
    if (exists expression = \ithrow.expression) {
        result = Throw(expressionToCeylon(expression, update));
    } else {
        result = Throw();
    }
    update(\ithrow, result);
    return result;
}

"Compiles the given [[code]] for a Throw
 into a [[Throw]] using the Ceylon compiler
 (more specifically, the rule for a `throw`)."
shared Throw? compileThrow(String code, Anything(JNode,Node) update = noop) {
    if (is JThrow jDirectiveStatement = createParser(code).directiveStatement()) {
        // throwDirective doesn’t contain the semicolon
        return throwToCeylon(jDirectiveStatement, update);
    } else {
        return null;
    }
}

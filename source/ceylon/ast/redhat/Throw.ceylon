import ceylon.ast.core {
    Throw
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JThrow=Throw
    }
}

"Converts a RedHat AST [[Throw|JThrow]] to a `ceylon.ast` [[Throw]]."
shared Throw throwToCeylon(JThrow \ithrow) {
    if (exists expression = \ithrow.expression) {
        return Throw(expressionToCeylon(expression));
    } else {
        return Throw();
    }
}

"Compiles the given [[code]] for a Throw
 into a [[Throw]] using the Ceylon compiler
 (more specifically, the rule for a `throw`)."
shared Throw? compileThrow(String code) {
    if (is JThrow jDirectiveStatement = createParser(code).directiveStatement()) {
        // throwDirective doesn’t contain the semicolon
        return throwToCeylon(jDirectiveStatement);
    } else {
        return null;
    }
}

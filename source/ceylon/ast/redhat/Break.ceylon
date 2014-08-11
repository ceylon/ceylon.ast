import ceylon.ast.core {
    Break
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBreak=Break
    }
}

"Converts a RedHat AST [[Break|JBreak]] to a `ceylon.ast` [[Break]]."
shared Break breakToCeylon(JBreak \ibreak) {
    return Break();
}

"Compiles the given [[code]] for a Break
 into a [[Break]] using the Ceylon compiler
 (more specifically, the rule for a `directiveStatement`)."
shared Break? compileBreak(String code) {
    if (is JBreak jDirectiveStatement = createParser(code).directiveStatement()) {
        // breakDirective doesn’t contain the semicolon
        return breakToCeylon(jDirectiveStatement);
    } else {
        return null;
    }
}

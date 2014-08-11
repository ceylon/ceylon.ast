import ceylon.ast.core {
    Directive
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBreak=Break,
        JContinue=Continue,
        JDirective=Directive,
        JReturn=Return,
        JThrow=Throw
    }
}

"Converts a RedHat AST [[Directive|JDirective]] to a `ceylon.ast` [[Directive]]."
shared Directive directiveToCeylon(JDirective directive) {
    assert (is JReturn|JThrow|JBreak|JContinue directive);
    switch (directive)
    case (is JReturn) { return returnToCeylon(directive); }
    case (is JThrow) { return throwToCeylon(directive); }
    case (is JBreak) { return breakToCeylon(directive); }
    case (is JContinue) { return continueToCeylon(directive); }
}

"Compiles the given [[code]] for a Directive
 into a [[Directive]] using the Ceylon compiler
 (more specifically, the rule for a `directive`)."
shared Directive? compileDirective(String code) {
    if (exists jDirective = createParser(code).directive()) {
        return directiveToCeylon(jDirective);
    } else {
        return null;
    }
}

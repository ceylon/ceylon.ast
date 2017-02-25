import ceylon.ast.core {
    Directive,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBreak=Break,
        JContinue=Continue,
        JDirective=Directive,
        JReturn=Return,
        JThrow=Throw
    }
}

"Converts a RedHat AST [[Directive|JDirective]] to a `ceylon.ast` [[Directive]]."
shared Directive directiveToCeylon(JDirective directive, Anything(JNode, Node) update = noop) {
    assert (is JReturn|JThrow|JBreak|JContinue directive);
    switch (directive)
    case (is JReturn) { return returnToCeylon(directive, update); }
    case (is JThrow) { return throwToCeylon(directive, update); }
    case (is JBreak) { return breakToCeylon(directive, update); }
    case (is JContinue) { return continueToCeylon(directive, update); }
}

"Parses the given [[code]] for a Directive
 into a [[Directive]] using the Ceylon compiler
 (more specifically, the rule for a `directive`)."
shared Directive? parseDirective(String code, Anything(JNode, Node) update = noop) {
    if (exists jDirective = createParser(code).directive()) {
        return directiveToCeylon(jDirective, update);
    } else {
        return null;
    }
}

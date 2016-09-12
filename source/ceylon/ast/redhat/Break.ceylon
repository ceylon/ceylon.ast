import ceylon.ast.core {
    Break,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBreak=Break
    }
}

"Converts a RedHat AST [[Break|JBreak]] to a `ceylon.ast` [[Break]]."
shared Break breakToCeylon(JBreak \ibreak, Anything(JNode,Node) update = noop) {
    value result = Break();
    update(\ibreak, result);
    return result;
}

"Parses the given [[code]] for a Break
 into a [[Break]] using the Ceylon compiler
 (more specifically, the rule for a `directiveStatement`)."
shared Break? parseBreak(String code, Anything(JNode,Node) update = noop) {
    if (is JBreak jDirectiveStatement = createParser(code).directiveStatement()) {
        // breakDirective doesn’t contain the semicolon
        return breakToCeylon(jDirectiveStatement, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Node,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[ValueModifier|JValueModifier]] to a `ceylon.ast` [[ValueModifier]]."
shared ValueModifier valueModifierToCeylon(JValueModifier valueModifier, Anything(JNode,Node) update = noop) {
    value result = ValueModifier();
    update(valueModifier, result);
    return result;
}

"Compiles the given [[code]] for a Value Modifier
 into a [[ValueModifier]]."
shared ValueModifier? compileValueModifier(String code, Anything(JNode,Node) update = noop) {
    return code.trimmed == "value" then ValueModifier();
}

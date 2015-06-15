import ceylon.ast.core {
    Node,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JVoidModifier=VoidModifier
    }
}

"Converts a RedHat AST [[VoidModifier|JVoidModifier]] to a `ceylon.ast` [[VoidModifier]]."
shared VoidModifier voidModifierToCeylon(JVoidModifier voidModifier, Anything(JNode,Node) update = noop) {
    value result = VoidModifier();
    update(voidModifier, result);
    return result;
}

"Compiles the given [[code]] for a Void Modifier
 into a [[VoidModifier]]."
shared VoidModifier? compileVoidModifier(String code, Anything(JNode,Node) update = noop) {
    return code.trimmed == "void" then VoidModifier();
}

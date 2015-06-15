import ceylon.ast.core {
    DynamicModifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier
    }
}

"Converts a RedHat AST [[DynamicModifier|JDynamicModifier]] to a `ceylon.ast` [[DynamicModifier]]."
shared DynamicModifier dynamicModifierToCeylon(JDynamicModifier dynamicModifier, Anything(JNode,Node) update = noop) {
    value result = DynamicModifier();
    update(dynamicModifier, result);
    return result;
}

"Compiles the given [[code]] for a Dynamic Modifier
 into a [[DynamicModifier]]."
shared DynamicModifier? compileDynamicModifier(String code, Anything(JNode,Node) update = noop) {
    return code.trimmed == "dynamic" then DynamicModifier();
}

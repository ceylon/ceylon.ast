import ceylon.ast.core {
    DynamicModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier
    }
}

"Converts a RedHat AST [[DynamicModifier|JDynamicModifier]] to a `ceylon.ast` [[DynamicModifier]]."
shared DynamicModifier dynamicModifierToCeylon(JDynamicModifier dynamicModifier) {
    return DynamicModifier();
}

"Compiles the given [[code]] for a Dynamic Modifier
 into a [[DynamicModifier]]."
shared DynamicModifier? compileDynamicModifier(String code) {
    return code.trimmed == "dynamic" then DynamicModifier();
}

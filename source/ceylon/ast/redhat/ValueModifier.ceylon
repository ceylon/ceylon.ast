import ceylon.ast.core {
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[ValueModifier|JValueModifier]] to a `ceylon.ast` [[ValueModifier]]."
shared ValueModifier valueModifierToCeylon(JValueModifier valueModifier) {
    return ValueModifier();
}

"Compiles the given [[code]] for a Value Modifier
 into a [[ValueModifier]]."
shared ValueModifier? compileValueModifier(String code) {
    return code.trimmed == "value" then ValueModifier();
}

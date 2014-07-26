import ceylon.ast.core {
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JVoidModifier=VoidModifier
    }
}

"Converts a RedHat AST [[VoidModifier|JVoidModifier]] to a `ceylon.ast` [[VoidModifier]]."
shared VoidModifier voidModifierToCeylon(JVoidModifier voidModifier) {
    return VoidModifier();
}

"Compiles the given [[code]] for a Void Modifier
 into a [[VoidModifier]]."
shared VoidModifier? compileVoidModifier(String code) {
    return code.trimmed == "void" then VoidModifier();
}

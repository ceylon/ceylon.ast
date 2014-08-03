import ceylon.ast.core {
    FunctionModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionModifier=FunctionModifier
    }
}

"Converts a RedHat AST [[FunctionModifier|JFunctionModifier]] to a `ceylon.ast` [[FunctionModifier]]."
shared FunctionModifier functionModifierToCeylon(JFunctionModifier functionModifier) {
    return FunctionModifier();
}

"Compiles the given [[code]] for a Function Modifier
 into a [[FunctionModifier]] using the Ceylon compiler
 (more specifically, the rule for a `functionModifier`)."
shared FunctionModifier? compileFunctionModifier(String code) {
    return code.trimmed == "function" then FunctionModifier();
}

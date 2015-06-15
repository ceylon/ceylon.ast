import ceylon.ast.core {
    FunctionModifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionModifier=FunctionModifier
    }
}

"Converts a RedHat AST [[FunctionModifier|JFunctionModifier]] to a `ceylon.ast` [[FunctionModifier]]."
shared FunctionModifier functionModifierToCeylon(JFunctionModifier functionModifier, Anything(JNode,Node) update = noop) {
    value result = FunctionModifier();
    update(functionModifier, result);
    return result;
}

"Compiles the given [[code]] for a Function Modifier
 into a [[FunctionModifier]] using the Ceylon compiler
 (more specifically, the rule for a `functionModifier`)."
shared FunctionModifier? compileFunctionModifier(String code, Anything(JNode,Node) update = noop) {
    return code.trimmed == "function" then FunctionModifier();
}

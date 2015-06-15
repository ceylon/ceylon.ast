import ceylon.ast.core {
    LocalModifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionModifier=FunctionModifier,
        JLocalModifier=LocalModifier,
        JValueModifier=ValueModifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        function_modifier=\iFUNCTION_MODIFIER,
        value_modifier=\iVALUE_MODIFIER
    }
}

"Converts a RedHat AST [[LocalModifier|JLocalModifier]] to a `ceylon.ast` [[LocalModifier]]."
shared LocalModifier localModifierToCeylon(JLocalModifier localModifier, Anything(JNode,Node) update = noop) {
    assert (is JValueModifier|JFunctionModifier localModifier);
    switch (localModifier)
    case (is JValueModifier) { return valueModifierToCeylon(localModifier, update); }
    case (is JFunctionModifier) { return functionModifierToCeylon(localModifier, update); }
}

"Compiles the given [[code]] for a Local Modifier
 into a [[LocalModifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared LocalModifier? compileLocalModifier(String code, Anything(JNode,Node) update = noop) {
    value type = createParser(code).tokenStream.\iLA(1);
    if (type == value_modifier) {
        return compileValueModifier(code, update);
    } else if (type == function_modifier) {
        return compileFunctionModifier(code, update);
    } else {
        return null;
    }
}

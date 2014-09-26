import ceylon.ast.core {
    TypeModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JVoidModifier=VoidModifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        dynamicModifier=\iDYNAMIC,
        function_modifier=\iFUNCTION_MODIFIER,
        value_modifier=\iVALUE_MODIFIER,
        void_modifier=\iVOID_MODIFIER
    }
}

"Converts a RedHat AST [[LocalModifier|JLocalModifier]], [[VoidModifier|JVoidModifier]]
 or [[DynamicModifier|JDynamicModifier]] to a `ceylon.ast` [[TypeModifier]]."
shared TypeModifier typeModifierToCeylon(JLocalModifier|JVoidModifier|JDynamicModifier typeModifier) {
    switch (typeModifier)
    case (is JLocalModifier) { return localModifierToCeylon(typeModifier); }
    case (is JVoidModifier) { return voidModifierToCeylon(typeModifier); }
    case (is JDynamicModifier) { return dynamicModifierToCeylon(typeModifier); }
}

"Compiles the given [[code]] for a Type Modifier
 into a [[TypeModifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared TypeModifier? compileTypeModifier(String code) {
    value type = createParser(code).tokenStream.\iLA(1);
    if (type == void_modifier) {
        return compileVoidModifier(code);
    } else if (type == value_modifier) {
        return compileValueModifier(code);
    } else if (type == function_modifier) {
        return compileFunctionModifier(code);
    } else if (type == dynamicModifier) {
        return compileDynamicModifier(code);
    } else {
        return null;
    }
}

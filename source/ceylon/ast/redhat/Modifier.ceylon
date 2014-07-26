import ceylon.ast.core {
    Modifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JVoidModifier=VoidModifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        dynamicModifier=\iDYNAMIC,
        void_modifier=\iVOID_MODIFIER
    }
}

"Converts a RedHat AST [[VoidModifier|JVoidModifier]] or [[DynamicModifier|JDynamicModifier]]
 to a `ceylon.ast` [[Modifier]]."
shared Modifier modifierToCeylon(JVoidModifier|JDynamicModifier modifier) {
    switch (modifier)
    case (is JVoidModifier) { return voidModifierToCeylon(modifier); }
    case (is JDynamicModifier) { return dynamicModifierToCeylon(modifier); }
}

"Compiles the given [[code]] for a Modifier
 into a [[Modifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared Modifier? compileModifier(String code) {
    value type = createParser(code).tokenStream.\iLA(1);
    if (type == void_modifier) {
        return compileVoidModifier(code);
    } else if (type == dynamicModifier) {
        return compileDynamicModifier(code);
    } else {
        return null;
    }
}

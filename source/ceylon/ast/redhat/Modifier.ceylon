import ceylon.ast.core {
    Modifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        dynamicModifier=\iDYNAMIC
    }
}

"Converts a RedHat AST [[DynamicModifier|JDynamicModifier]] to a `ceylon.ast` [[Modifier]]."
shared Modifier modifierToCeylon(JDynamicModifier modifier) {
    //assert (is JDynamicModifier modifier);
    switch (modifier)
    case (is JDynamicModifier) { return dynamicModifierToCeylon(modifier); }
}

"Compiles the given [[code]] for a Modifier
 into a [[Modifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared Modifier? compileModifier(String code) {
    value type = createParser(code).tokenStream.\iLA(1);
    if (type == dynamicModifier) {
        return compileDynamicModifier(code);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Modifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JFunctionModifier=FunctionModifier,
        JLocalModifier=LocalModifier,
        JTypeVariance=TypeVariance,
        JValueModifier=ValueModifier,
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
shared Modifier modifierToCeylon(JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance modifier) {
    switch (modifier)
    case (is JVoidModifier) { return voidModifierToCeylon(modifier); }
    case (is JLocalModifier) {
        assert (is JValueModifier|JFunctionModifier modifier);
        switch (modifier)
        case (is JValueModifier) { return valueModifierToCeylon(modifier); }
        case (is JFunctionModifier) {
            // TODO implement function modifiers
            throw AssertionError("Function modifiers not yet implemented");
        }
    }
    case (is JDynamicModifier) { return dynamicModifierToCeylon(modifier); }
    case (is JTypeVariance) { return varianceToCeylon(modifier); }
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
    } else if (exists variance = compileVariance(code)) {
        return variance;
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Modifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JTypeVariance=TypeVariance,
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

"Converts a RedHat AST [[VoidModifier|JVoidModifier]] or [[DynamicModifier|JDynamicModifier]]
 to a `ceylon.ast` [[Modifier]]."
shared Modifier modifierToCeylon(JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance modifier, Anything(JNode,Node) update = noop) {
    switch (modifier)
    case (is JLocalModifier|JVoidModifier|JDynamicModifier) { return typeModifierToCeylon(modifier, update); }
    case (is JTypeVariance) { return varianceToCeylon(modifier, update); }
}

"Parses the given [[code]] for a Modifier
 into a [[Modifier]] using the Ceylon compiler
 (more specifically, the lexer)."
shared Modifier? parseModifier(String code, Anything(JNode,Node) update = noop) {
    value type = createParser(code).tokenStream.\iLA(1);
    if (type == void_modifier) {
        return parseVoidModifier(code, update);
    } else if (type == value_modifier) {
        return parseValueModifier(code, update);
    } else if (type == function_modifier) {
        return parseFunctionModifier(code, update);
    } else if (type == dynamicModifier) {
        return parseDynamicModifier(code, update);
    } else if (exists variance = parseVariance(code, update)) {
        return variance;
    } else {
        return null;
    }
}

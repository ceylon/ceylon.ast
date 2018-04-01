import ceylon.ast.core {
    Modifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    modifierToCeylon,
    parseModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JTypeVariance=TypeVariance,
        JVoidModifier=VoidModifier
    }
}

shared object modifier satisfies AbstractTest<Modifier,JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance> {
    parse = parseModifier;
    fromCeylon = RedHatTransformer.transformModifier;
    toCeylon = modifierToCeylon;
    
    tests = [typeModifier, variance];
}

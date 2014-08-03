import ceylon.ast.core {
    Modifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    modifierToCeylon,
    compileModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JTypeVariance=TypeVariance,
        JVoidModifier=VoidModifier
    }
}

shared object modifier satisfies AbstractTest<Modifier,JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance> {
    compile = compileModifier;
    fromCeylon = RedHatTransformer.transformModifier;
    toCeylon = modifierToCeylon;
    
    tests = [voidModifier, valueModifier, functionModifier, dynamicModifier, variance];
}

import ceylon.ast.core {
    InModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    inModifierToCeylon,
    compileInModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeVariance=TypeVariance
    }
}

shared object inModifier satisfies ConcreteTest<InModifier,JTypeVariance> {
    
    shared String->InModifier inModifier = " in "->InModifier();
    
    compile = compileInModifier;
    fromCeylon = RedHatTransformer.transformInModifier;
    toCeylon = inModifierToCeylon;
    codes = [inModifier];
}

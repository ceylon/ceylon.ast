import ceylon.ast.core {
    LocalModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    localModifierToCeylon,
    compileLocalModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLocalModifier=LocalModifier
    }
}

shared object localModifier satisfies AbstractTest<LocalModifier,JLocalModifier> {
    compile = compileLocalModifier;
    fromCeylon = RedHatTransformer.transformLocalModifier;
    toCeylon = localModifierToCeylon;
    
    tests = [valueModifier, functionModifier];
}

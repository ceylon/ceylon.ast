import ceylon.ast.core {
    LocalModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    localModifierToCeylon,
    parseLocalModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JLocalModifier=LocalModifier
    }
}

shared object localModifier satisfies AbstractTest<LocalModifier,JLocalModifier> {
    parse = parseLocalModifier;
    fromCeylon = RedHatTransformer.transformLocalModifier;
    toCeylon = localModifierToCeylon;
    
    tests = [valueModifier, functionModifier];
}

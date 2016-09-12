import ceylon.ast.core {
    TypeModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeModifierToCeylon,
    parseTypeModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JVoidModifier=VoidModifier
    }
}

shared object typeModifier satisfies AbstractTest<TypeModifier,JLocalModifier|JVoidModifier|JDynamicModifier> {
    parse = parseTypeModifier;
    fromCeylon = RedHatTransformer.transformTypeModifier;
    toCeylon = typeModifierToCeylon;
    
    tests = [localModifier, voidModifier, dynamicModifier];
}

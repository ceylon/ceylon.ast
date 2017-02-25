import ceylon.ast.core {
    DynamicModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    dynamicModifierToCeylon,
    parseDynamicModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier
    }
}

shared object dynamicModifier satisfies ConcreteTest<DynamicModifier,JDynamicModifier> {
    
    shared String->DynamicModifier dynamicModifier = "dynamic" -> DynamicModifier();
    
    parse = parseDynamicModifier;
    fromCeylon = RedHatTransformer.transformDynamicModifier;
    toCeylon = dynamicModifierToCeylon;
    codes = [dynamicModifier];
}

import ceylon.ast.core {
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueModifierToCeylon,
    compileValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueModifier=ValueModifier
    }
}

shared object valueModifier satisfies ConcreteTest<ValueModifier,JValueModifier> {
    
    shared String->ValueModifier valueModifier = "value"->ValueModifier();
    
    compile = compileValueModifier;
    fromCeylon = RedHatTransformer.transformValueModifier;
    toCeylon = valueModifierToCeylon;
    codes = [valueModifier];
}

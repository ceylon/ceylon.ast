import ceylon.ast.core {
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueModifierToCeylon,
    parseValueModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JValueModifier=ValueModifier
    }
}

shared object valueModifier satisfies ConcreteTest<ValueModifier,JValueModifier> {
    
    shared String->ValueModifier valueModifier = "value" -> ValueModifier();
    
    parse = parseValueModifier;
    fromCeylon = RedHatTransformer.transformValueModifier;
    toCeylon = valueModifierToCeylon;
    codes = [valueModifier];
}

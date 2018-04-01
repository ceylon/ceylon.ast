import ceylon.ast.core {
    OutModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    outModifierToCeylon,
    parseOutModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeVariance=TypeVariance
    }
}

shared object outModifier satisfies ConcreteTest<OutModifier,JTypeVariance> {
    
    shared String->OutModifier outModifier = " out " -> OutModifier();
    
    parse = parseOutModifier;
    fromCeylon = RedHatTransformer.transformOutModifier;
    toCeylon = outModifierToCeylon;
    codes = [outModifier];
}

import ceylon.ast.core {
    OutModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    outModifierToCeylon,
    compileOutModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeVariance=TypeVariance
    }
}

shared object outModifier satisfies ConcreteTest<OutModifier,JTypeVariance> {
    
    shared String->OutModifier outModifier = " out "->OutModifier();
    
    compile = compileOutModifier;
    fromCeylon = RedHatTransformer.transformOutModifier;
    toCeylon = outModifierToCeylon;
    codes = [outModifier];
}

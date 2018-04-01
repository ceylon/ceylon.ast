import ceylon.ast.core {
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    voidModifierToCeylon,
    parseVoidModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JVoidModifier=VoidModifier
    }
}

shared object voidModifier satisfies ConcreteTest<VoidModifier,JVoidModifier> {
    
    shared String->VoidModifier voidModifier = "void" -> VoidModifier();
    
    parse = parseVoidModifier;
    fromCeylon = RedHatTransformer.transformVoidModifier;
    toCeylon = voidModifierToCeylon;
    codes = [voidModifier];
}

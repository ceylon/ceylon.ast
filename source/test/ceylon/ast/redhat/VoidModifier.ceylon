import ceylon.ast.core {
    VoidModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    voidModifierToCeylon,
    compileVoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JVoidModifier=VoidModifier
    }
}

shared object voidModifier satisfies ConcreteTest<VoidModifier,JVoidModifier> {
    
    shared String->VoidModifier voidModifier = "void"->VoidModifier();
    
    compile = compileVoidModifier;
    fromCeylon = RedHatTransformer.transformVoidModifier;
    toCeylon = voidModifierToCeylon;
    codes = [voidModifier];
}

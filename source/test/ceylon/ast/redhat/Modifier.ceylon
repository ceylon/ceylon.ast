import ceylon.ast.core {
    Modifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    modifierToCeylon,
    compileModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier
    }
}

shared object modifier satisfies AbstractTest<Modifier,JDynamicModifier> {
    compile = compileModifier;
    fromCeylon = RedHatTransformer.transformModifier;
    toCeylon = modifierToCeylon;
    
    tests = [dynamicModifier];
}

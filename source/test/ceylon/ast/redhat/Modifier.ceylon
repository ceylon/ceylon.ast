import ceylon.ast.core {
    Modifier,
    Node
}
import ceylon.ast.redhat {
    RedHatTransformer,
    modifierToCeylon,
    compileModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JTypeVariance=TypeVariance,
        JVoidModifier=VoidModifier
    }
}

shared object modifier satisfies AbstractTest<Modifier,JNode/*JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance*/> {
    compile = compileModifier;
    fromCeylon = RedHatTransformer.transformModifier;
    //toCeylon = modifierToCeylon;
    shared actual Modifier toCeylon(JNode jNode, Anything(JNode,Node) update) {
        assert (is JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance jNode);
        return modifierToCeylon(jNode, update);
    }
    
    tests = [typeModifier, variance];
}

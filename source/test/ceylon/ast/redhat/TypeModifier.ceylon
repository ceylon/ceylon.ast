import ceylon.ast.core {
    Node,
    TypeModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeModifierToCeylon,
    compileTypeModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier,
        JLocalModifier=LocalModifier,
        JVoidModifier=VoidModifier
    }
}

shared object typeModifier satisfies AbstractTest<TypeModifier,JNode/*JLocalModifier|JVoidModifier|JDynamicModifier*/> {
    compile = compileTypeModifier;
    fromCeylon = RedHatTransformer.transformTypeModifier;
    //toCeylon = typeModifierToCeylon;
    shared actual TypeModifier toCeylon(JNode jNode, Anything(JNode,Node) update) {
        assert (is JLocalModifier|JVoidModifier|JDynamicModifier jNode);
        return typeModifierToCeylon(jNode, update);
    }
    
    tests = [localModifier, voidModifier, dynamicModifier];
}

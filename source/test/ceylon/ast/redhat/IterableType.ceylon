import ceylon.ast.core {
    IterableType,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    iterableTypeToCeylon,
    compileIterableType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIterableType=IterableType
    }
}

shared object iterableType satisfies ConcreteTest<IterableType,JIterableType> {
    
    String->IterableType construct(String->VariadicType var)
            => "{``var.key``}"->IterableType(var.item);
    
    shared String->IterableType stringStarIterableType = construct(variadicType.stringStarType);
    shared String->IterableType iterableOfStringPlusIterableType = construct(variadicType.iterableOfStringPlusType);
    shared String->IterableType emptyIterableType = "{}"->IterableType(null);
    
    // not tested directly, but used by other tests
    shared String->IterableType characterStarIterableType = construct(variadicType.characterStarType);
    
    compile = compileIterableType;
    fromCeylon = RedHatTransformer.transformIterableType;
    toCeylon = iterableTypeToCeylon;
    codes = [stringStarIterableType, iterableOfStringPlusIterableType, emptyIterableType];
}

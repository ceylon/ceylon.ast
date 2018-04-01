import ceylon.ast.core {
    IterableType,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    iterableTypeToCeylon,
    parseIterableType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JIterableType=IterableType
    }
}

shared object iterableType satisfies ConcreteTest<IterableType,JIterableType> {
    
    String->IterableType construct(String->VariadicType var)
            => "{``var.key``}" -> IterableType(var.item);
    
    shared String->IterableType stringStarIterableType = construct(variadicType.stringStarType);
    shared String->IterableType iterableOfStringPlusIterableType = construct(variadicType.iterableOfStringPlusType);
    
    // not tested directly, but used by other tests
    shared String->IterableType characterStarIterableType = construct(variadicType.characterStarType);
    
    parse = parseIterableType;
    fromCeylon = RedHatTransformer.transformIterableType;
    toCeylon = iterableTypeToCeylon;
    codes = [stringStarIterableType, iterableOfStringPlusIterableType];
}

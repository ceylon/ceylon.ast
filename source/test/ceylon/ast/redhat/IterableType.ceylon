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
    
    shared actual IterableType? compile(String code) => compileIterableType(code);
    shared actual JIterableType fromCeylon(RedHatTransformer transformer)(IterableType node) => transformer.transformIterableType(node);
    shared actual IterableType toCeylon(JIterableType node) => iterableTypeToCeylon(node);
    codes = [stringStarIterableType, iterableOfStringPlusIterableType, emptyIterableType];
}

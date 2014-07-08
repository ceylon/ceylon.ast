import ceylon.ast.core {
    Type,
    TypeMeta
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeMetaToCeylon,
    compileTypeMeta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeLiteral=TypeLiteral
    }
}

shared object typeMeta satisfies ConcreteTest<TypeMeta,JTypeLiteral> {
    
    String->TypeMeta construct(String->Type t)
            => ("`" + t.key + "`")->TypeMeta(t.item);
    
    shared String->TypeMeta integerFloatDefaultedStringStarTupleTypeTypeMeta = construct(tupleType.integerFloatDefaultedStringStarTupleType);
    shared String->TypeMeta stringToIterableOfStringEntryTypeTypeMeta = construct(entryType.stringToIterableOfStringEntryType);
    
    shared actual TypeMeta? compile(String code) => compileTypeMeta(code);
    shared actual JTypeLiteral fromCeylon(RedHatTransformer transformer)(TypeMeta node) => transformer.transformTypeMeta(node);
    shared actual TypeMeta toCeylon(JTypeLiteral node) => typeMetaToCeylon(node);
    codes = [integerFloatDefaultedStringStarTupleTypeTypeMeta, stringToIterableOfStringEntryTypeTypeMeta];
}

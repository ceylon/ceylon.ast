import ceylon.ast.core {
    Type,
    TypeMeta
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeMetaToCeylon,
    parseTypeMeta
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeLiteral=TypeLiteral
    }
}

shared object typeMeta satisfies ConcreteTest<TypeMeta,JTypeLiteral> {
    
    String->TypeMeta construct(String->Type t)
            => ("`" + t.key + "`") -> TypeMeta(t.item);
    
    shared String->TypeMeta integerFloatDefaultedStringStarTupleTypeTypeMeta = construct(tupleType.integerFloatDefaultedStringStarTupleType);
    shared String->TypeMeta stringToIterableOfStringEntryTypeTypeMeta = construct(entryType.stringToIterableOfStringEntryType);
    shared String->TypeMeta packageObjectMeta = construct(baseType.objectPackageQualifiedType);
    
    parse = parseTypeMeta;
    fromCeylon = RedHatTransformer.transformTypeMeta;
    toCeylon = typeMetaToCeylon;
    codes = [integerFloatDefaultedStringStarTupleTypeTypeMeta, stringToIterableOfStringEntryTypeTypeMeta, packageObjectMeta];
}

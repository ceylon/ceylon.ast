import ceylon.ast.core {
    EntryType,
    MainType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    entryTypeToCeylon,
    compileEntryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEntryType=EntryType
    }
}

shared object entryType satisfies ConcreteTest<EntryType,JEntryType> {
    
    String->EntryType construct(String->MainType key, String->MainType item)
            => "``key.key``->``item.key``"->EntryType(key.item, item.item);
    
    shared String->EntryType stringToIterableOfStringEntryType = construct(baseType.stringType, baseType.iterableOfStringType);
    
    shared actual EntryType? compile(String code) => compileEntryType(code);
    shared actual JEntryType fromCeylon(RedHatTransformer transformer)(EntryType node) => transformer.transformEntryType(node);
    shared actual EntryType toCeylon(JEntryType node) => entryTypeToCeylon(node);
    codes = [stringToIterableOfStringEntryType];
}

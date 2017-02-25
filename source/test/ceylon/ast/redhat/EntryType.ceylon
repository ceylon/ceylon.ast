import ceylon.ast.core {
    EntryType,
    MainType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    entryTypeToCeylon,
    parseEntryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEntryType=EntryType
    }
}

shared object entryType satisfies ConcreteTest<EntryType,JEntryType> {
    
    String->EntryType construct(String->MainType key, String->MainType item)
            => "``key.key``->``item.key``" -> EntryType(key.item, item.item);
    
    shared String->EntryType stringToIterableOfStringEntryType = construct(baseType.stringType, baseType.iterableOfStringType);
    
    parse = parseEntryType;
    fromCeylon = RedHatTransformer.transformEntryType;
    toCeylon = entryTypeToCeylon;
    codes = [stringToIterableOfStringEntryType];
}

import ceylon.ast.core {
    EntryPattern,
    TuplePattern,
    VariablePattern
}
import ceylon.ast.redhat {
    RedHatTransformer,
    entryPatternToCeylon,
    parseEntryPattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JKeyValuePattern=KeyValuePattern
    }
}

shared object entryPattern satisfies ConcreteTest<EntryPattern,JKeyValuePattern> {
    
    String->EntryPattern construct(String->VariablePattern|TuplePattern key, String->VariablePattern|TuplePattern item)
            => "``key.key``->``item.key``" -> EntryPattern(key.item, item.item);
    
    shared String->EntryPattern eToStringLineEntryPattern = construct(variablePattern.eVariablePattern, variablePattern.stringLineVariablePattern);
    
    parse = parseEntryPattern;
    fromCeylon = RedHatTransformer.transformEntryPattern;
    toCeylon = entryPatternToCeylon;
    codes = [eToStringLineEntryPattern];
}

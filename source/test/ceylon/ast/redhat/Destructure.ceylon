import ceylon.ast.core {
    Destructure,
    EntryPattern,
    Specifier,
    TuplePattern,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    destructureToCeylon,
    parseDestructure
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDestructure=Destructure
    }
}

shared object destructure satisfies ConcreteTest<Destructure,JDestructure> {
    
    String->Destructure construct(String->TuplePattern|EntryPattern pattern, String->Specifier specifier, String->ValueModifier valueModifier = package.valueModifier.valueModifier)
            => "``valueModifier.key`` ``pattern.key`` ``specifier.key``" -> Destructure(pattern.item, specifier.item, valueModifier.item);
    
    shared String->Destructure firstRestTupleDestructure = construct(tuplePattern.firstRestTuplePattern, specifier.processArgumentsSequenceSpecifier);
    shared String->Destructure entryDestructure = construct(entryPattern.eToStringLineEntryPattern, specifier.oneSpecifier);
    
    parse = parseDestructure;
    fromCeylon = RedHatTransformer.transformDestructure;
    toCeylon = destructureToCeylon;
    codes = [firstRestTupleDestructure, entryDestructure];
}

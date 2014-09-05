import ceylon.ast.core {
    Identifier,
    LIdentifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    identifierToCeylon,
    compileIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIdentifier=Identifier
    }
}

shared object identifier satisfies ConcreteTest<Identifier,JIdentifier> {
    
    String->LIdentifier constructL(String name)
            => name->LIdentifier(name);
    String->UIdentifier constructU(String name)
            => name->UIdentifier(name);
    
    shared String->LIdentifier lidLIdentifier = "lid"->LIdentifier("lid");
    shared String->UIdentifier uidUIdentifier = "Uid"->UIdentifier("Uid");
    shared String->LIdentifier uidLIdentifier = "\\iUid"->LIdentifier("Uid", true);
    shared String->UIdentifier lidUIdentifier = "\\Ilid"->UIdentifier("lid", true);
    
    // not tested directly, but used by other tests
    shared String->LIdentifier sharedLIdentifier = constructL("shared");
    shared String->LIdentifier byLIdentifier = constructL("by");
    shared String->LIdentifier noopLIdentifier = constructL("noop");
    shared String->LIdentifier ceylonLIdentifier = constructL("ceylon");
    shared String->LIdentifier astLIdentifier = constructL("ast");
    shared String->LIdentifier coreLIdentifier = constructL("core");
    shared String->LIdentifier javaLIdentifier = constructL("java");
    shared String->LIdentifier langLIdentifier = constructL("lang");
    shared String->LIdentifier collectionLIdentifier = constructL("collection");
    shared String->UIdentifier stringUIdentifier = constructU("String");
    shared String->UIdentifier jstringUIdentifier = constructU("JString");
    shared String->LIdentifier outLIdentifier = "\\iout"->LIdentifier("out", true);
    shared String->LIdentifier sysoutLIdentifier = constructL("sysout");
    shared String->UIdentifier systemUIdentifier = constructU("System");
    shared String->UIdentifier arrayListUIdentifier = constructU("ArrayList");
    shared String->UIdentifier mutableListUIdentifier = constructU("MutableList");
    shared String->LIdentifier nullLIdentifier = constructL("null");
    shared String->UIdentifier nullUIdentifier = constructU("Null");
    shared String->UIdentifier variadicStringUIdentifier = constructU("VariadicString");
    shared String->LIdentifier charactersLIdentifier = constructL("characters");
    shared String->LIdentifier nameLIdentifier = constructL("name");
    shared String->LIdentifier argsLIdentifier = constructL("args");
    shared String->LIdentifier personLIdentifier = constructL("person");
    shared String->LIdentifier charLIdentifier = constructL("char");
    shared String->LIdentifier indexLIdentifier = constructL("index");
    shared String->LIdentifier eLIdentifier = constructL("e");
    shared String->LIdentifier tLIdentifier = constructL("t");
    shared String->UIdentifier typeNameUIdentifier = constructU("TypeName");
    shared String->LIdentifier concatenateLIdentifier = constructL("concatenate");
    shared String->LIdentifier mapLIdentifier = constructL("map");
    shared String->LIdentifier firstLIdentifier = constructL("first");
    
    compile = compileIdentifier;
    fromCeylon = RedHatTransformer.transformIdentifier;
    toCeylon = identifierToCeylon;
    codes = [lidLIdentifier, uidUIdentifier, uidLIdentifier, lidUIdentifier];
}

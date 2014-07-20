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
    shared String->LIdentifier lidLIdentifier = "lid"->LIdentifier("lid");
    shared String->UIdentifier uidUIdentifier = "Uid"->UIdentifier("Uid");
    shared String->LIdentifier uidLIdentifier = "\\iUid"->LIdentifier("Uid");
    shared String->UIdentifier lidUIdentifier = "\\Ilid"->UIdentifier("lid");
    
    compile = compileIdentifier;
    fromCeylon = RedHatTransformer.transformIdentifier;
    toCeylon = identifierToCeylon;
    codes = [lidLIdentifier, uidUIdentifier, uidLIdentifier, lidUIdentifier];
}

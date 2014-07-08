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
    shared String->Identifier lidLIdentifier = "lid"->LIdentifier("lid");
    shared String->Identifier uidUIdentifier = "Uid"->UIdentifier("Uid");
    shared String->Identifier uidLIdentifier = "\\iUid"->LIdentifier("Uid");
    shared String->Identifier lidUIdentifier = "\\Ilid"->UIdentifier("lid");
    
    shared actual Identifier? compile(String code) => compileIdentifier(code);
    shared actual JIdentifier fromCeylon(RedHatTransformer transformer)(Identifier node) => transformer.transformIdentifier(node);
    shared actual Identifier toCeylon(JIdentifier node) => identifierToCeylon(node);
    codes = [lidLIdentifier, uidUIdentifier, uidLIdentifier, lidUIdentifier];
}

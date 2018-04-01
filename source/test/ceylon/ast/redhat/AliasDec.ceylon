import ceylon.ast.core {
    AliasDec,
    DecQualifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    aliasDecToCeylon,
    parseAliasDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAliasLiteral=AliasLiteral
    }
}

shared object aliasDec satisfies ConcreteTest<AliasDec,JAliasLiteral> {
    
    String->AliasDec construct(String->UIdentifier name, String->DecQualifier qualifier = "" -> DecQualifier()) {
        String qualification;
        if (qualifier.item.children nonempty) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` alias ``qualification````name.key`` `" -> AliasDec(name.item, qualifier.item);
    }
    
    shared String->AliasDec typeNameAliasDec = construct(identifier.typeNameUIdentifier);
    shared String->AliasDec abcAliasDec = construct("C" -> UIdentifier("C"), "A.B" -> DecQualifier([UIdentifier("A"), UIdentifier("B")]));
    
    parse = parseAliasDec;
    fromCeylon = RedHatTransformer.transformAliasDec;
    toCeylon = aliasDecToCeylon;
    codes = [typeNameAliasDec, abcAliasDec];
}

import ceylon.ast.core {
    DecQualifier,
    GivenDec,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    givenDecToCeylon,
    parseGivenDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

shared object givenDec satisfies ConcreteTest<GivenDec,JTypeParameterLiteral> {
    
    String->GivenDec construct(String->UIdentifier name, String->DecQualifier qualifier = "" -> DecQualifier()) {
        String qualification;
        if (qualifier.item.children nonempty) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` given ``qualification````name.key`` `" -> GivenDec(name.item, qualifier.item);
    }
    
    shared String->GivenDec keyGivenDec = construct(identifier.keyUIdentifier);
    
    parse = parseGivenDec;
    fromCeylon = RedHatTransformer.transformGivenDec;
    toCeylon = givenDecToCeylon;
    codes = [keyGivenDec];
}

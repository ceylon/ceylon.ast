import ceylon.ast.core {
    AliasDec,
    DecQualifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    aliasDecToCeylon,
    compileAliasDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAliasLiteral=AliasLiteral
    }
}

shared object aliasDec satisfies ConcreteTest<AliasDec,JAliasLiteral> {
    
    String->AliasDec construct(String->UIdentifier name, <String->DecQualifier>? qualifier = null) {
        String qualification;
        if (exists qualifier) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` alias ``qualification````name.key`` `"->AliasDec(name.item, qualifier?.item);
    }
    
    shared String->AliasDec typeNameAliasDec = construct(identifier.typeNameUIdentifier);
    shared String->AliasDec abcAliasDec = construct("C"->UIdentifier("C"), "A.B"->DecQualifier([UIdentifier("A"), UIdentifier("B")]));
    
    compile = compileAliasDec;
    fromCeylon = RedHatTransformer.transformAliasDec;
    toCeylon = aliasDecToCeylon;
    codes = [typeNameAliasDec, abcAliasDec];
}

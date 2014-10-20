import ceylon.ast.core {
    DecQualifier,
    InterfaceDec,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    interfaceDecToCeylon,
    compileInterfaceDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceLiteral=InterfaceLiteral
    }
}

shared object interfaceDec satisfies ConcreteTest<InterfaceDec,JInterfaceLiteral> {
    
    String->InterfaceDec construct(<String->UIdentifier>? name, <String->DecQualifier>? qualifier = null) {
        String qualification;
        if (exists qualifier) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` interface ``qualification```` name?.key else "" `` `"->InterfaceDec(name?.item, qualifier?.item);
    }
    
    shared String->InterfaceDec mutableListInterfaceDec = construct(identifier.mutableListUIdentifier);
    shared String->InterfaceDec abcInterfaceDec = construct("C"->UIdentifier("C"), "A.B"->DecQualifier([UIdentifier("A"), UIdentifier("B")]));
    shared String->InterfaceDec currentInterfaceDec = construct(null);
    
    compile = compileInterfaceDec;
    fromCeylon = RedHatTransformer.transformInterfaceDec;
    toCeylon = interfaceDecToCeylon;
    codes = [mutableListInterfaceDec, abcInterfaceDec, currentInterfaceDec];
}

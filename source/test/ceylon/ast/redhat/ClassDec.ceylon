import ceylon.ast.core {
    ClassDec,
    DecQualifier,
    Identifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classDecToCeylon,
    compileClassDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassLiteral=ClassLiteral
    }
}

shared object classDec satisfies ConcreteTest<ClassDec,JClassLiteral> {
    
    String->ClassDec construct(<String->Identifier>? name, <String->DecQualifier>? qualifier = null) {
        String qualification;
        if (exists qualifier) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` class ``qualification```` name?.key else "" `` `"->ClassDec(name?.item, qualifier?.item);
    }
    
    shared String->ClassDec stringClassDec = construct(identifier.stringUIdentifier);
    shared String->ClassDec abcClassDec = construct("C"->UIdentifier("C"), "A.B"->DecQualifier([UIdentifier("A"), UIdentifier("B")]));
    shared String->ClassDec currentClassDec = construct(null);
    
    compile = compileClassDec;
    fromCeylon = RedHatTransformer.transformClassDec;
    toCeylon = classDecToCeylon;
    codes = [stringClassDec, abcClassDec, currentClassDec];
}

import ceylon.ast.core {
    DecQualifier,
    LIdentifier,
    ValueDec,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueDecToCeylon,
    compileValueDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueLiteral=ValueLiteral
    }
}

shared object valueDec satisfies ConcreteTest<ValueDec,JValueLiteral> {
    
    String->ValueDec construct(String->LIdentifier name, <String->DecQualifier>? qualifier = null) {
        String qualification;
        if (exists qualifier) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` value ``qualification````name.key`` `"->ValueDec(name.item, qualifier?.item);
    }
    
    shared String->ValueDec nullValueDec = construct(identifier.nullLIdentifier);
    shared String->ValueDec iterableFirstValueDec = construct(identifier.firstLIdentifier, "Iterable"->DecQualifier([UIdentifier("Iterable")]));
    
    compile = compileValueDec;
    fromCeylon = RedHatTransformer.transformValueDec;
    toCeylon = valueDecToCeylon;
    codes = [nullValueDec, iterableFirstValueDec];
}

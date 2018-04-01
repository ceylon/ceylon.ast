import ceylon.ast.core {
    DecQualifier,
    FunctionDec,
    LIdentifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionDecToCeylon,
    parseFunctionDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral
    }
}

shared object functionDec satisfies ConcreteTest<FunctionDec,JFunctionLiteral> {
    
    String->FunctionDec construct(String->LIdentifier name, String->DecQualifier qualifier = "" -> DecQualifier()) {
        String qualification;
        if (qualifier.item.children nonempty) {
            qualification = qualifier.key + ".";
        } else {
            qualification = "";
        }
        return "` function ``qualification````name.key`` `" -> FunctionDec(name.item, qualifier.item);
    }
    
    shared String->FunctionDec concatenateFunctionDec = construct(identifier.concatenateLIdentifier);
    shared String->FunctionDec iterableMapFunctionDec = construct(identifier.mapLIdentifier, "Iterable" -> DecQualifier([UIdentifier("Iterable")]));
    
    parse = parseFunctionDec;
    fromCeylon = RedHatTransformer.transformFunctionDec;
    toCeylon = functionDecToCeylon;
    codes = [concatenateFunctionDec, iterableMapFunctionDec];
}

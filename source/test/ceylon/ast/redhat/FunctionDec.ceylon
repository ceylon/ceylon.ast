import ceylon.ast.core {
    DecQualifier,
    FunctionDec,
    LIdentifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionDecToCeylon,
    compileFunctionDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral
    }
}

shared object functionDec satisfies ConcreteTest<FunctionDec,JFunctionLiteral> {
    
    String->FunctionDec construct(String->LIdentifier name, <String->DecQualifier>? qualifier = null)
            => "` function ``(qualifier exists then (qualifier?.key else nothing) + "." else "")````name.key`` `"->FunctionDec(name.item, qualifier?.item);
    
    shared String->FunctionDec concatenateFunctionDec = construct(identifier.concatenateLIdentifier);
    shared String->FunctionDec iterableMapFunctionDec = construct(identifier.mapLIdentifier, "Iterable"->DecQualifier([UIdentifier("Iterable")]));
    
    compile = compileFunctionDec;
    fromCeylon = RedHatTransformer.transformFunctionDec;
    toCeylon = functionDecToCeylon;
    codes = [concatenateFunctionDec, iterableMapFunctionDec];
}
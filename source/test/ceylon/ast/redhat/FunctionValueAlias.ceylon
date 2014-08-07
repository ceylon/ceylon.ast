import ceylon.ast.core {
    FunctionValueAlias,
    LIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionValueAliasToCeylon,
    compileFunctionValueAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object functionValueAlias satisfies ConcreteTest<FunctionValueAlias,JAlias> {
    
    String->FunctionValueAlias construct(String->LIdentifier name)
            => "``name.key``="->FunctionValueAlias(name.item);
    
    shared String->FunctionValueAlias lidFunctionValueAlias = construct(identifier.lidLIdentifier);
    
    compile = compileFunctionValueAlias;
    fromCeylon = RedHatTransformer.transformFunctionValueAlias;
    toCeylon = functionValueAliasToCeylon;
    codes = [lidFunctionValueAlias];
}

import ceylon.ast.core {
    ArgumentList,
    PositionalArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    positionalArgumentsToCeylon,
    compilePositionalArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPositionalArgumentList=PositionalArgumentList
    }
}

shared object positionalArguments satisfies ConcreteTest<PositionalArguments,JPositionalArgumentList> {
    
    String->PositionalArguments construct(String->ArgumentList argumentList)
            => "(``argumentList.key``)"->PositionalArguments(argumentList.item);
    
    shared String->PositionalArguments emptyPositionalArguments = construct(argumentList.emptyArgumentList);
    shared String->PositionalArguments abcPositionalArguments = construct(argumentList.abcArgumentList);
    shared String->PositionalArguments spreadTextPositionalArguments = construct(argumentList.spreadTextArgumentList);
    
    // not tested directly, but used by other tests
    shared String->PositionalArguments helloWorldPositionalArguments = construct(argumentList.helloWorldArgumentList);
    shared String->PositionalArguments lucasPositionalArguments = construct(argumentList.lucasArgumentList);
    
    compile = compilePositionalArguments;
    fromCeylon = RedHatTransformer.transformPositionalArguments;
    toCeylon = positionalArgumentsToCeylon;
    codes = [emptyPositionalArguments, abcPositionalArguments, spreadTextPositionalArguments];
}

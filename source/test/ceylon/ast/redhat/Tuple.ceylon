import ceylon.ast.core {
    ArgumentList,
    Tuple
}
import ceylon.ast.redhat {
    RedHatTransformer,
    tupleToCeylon,
    compileTuple
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTuple=Tuple
    }
}

shared object tuple satisfies ConcreteTest<Tuple,JTuple> {
    
    String->Tuple construct(String->ArgumentList arguments)
            => "[``arguments.key``]"->Tuple(arguments.item);
    
    shared String->Tuple emptyTuple = construct(argumentList.emptyArgumentList);
    shared String->Tuple abcTuple = construct(argumentList.abcArgumentList);
    shared String->Tuple spreadTextTuple = construct(argumentList.spreadTextArgumentList);
    
    compile = compileTuple;
    fromCeylon = RedHatTransformer.transformTuple;
    toCeylon = tupleToCeylon;
    codes = [emptyTuple, abcTuple, spreadTextTuple];
}

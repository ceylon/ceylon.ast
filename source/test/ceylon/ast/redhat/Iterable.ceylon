import ceylon.ast.core {
    ArgumentList,
    Iterable
}
import ceylon.ast.redhat {
    RedHatTransformer,
    iterableToCeylon,
    compileIterable
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceEnumeration=SequenceEnumeration
    }
}

shared object iterable satisfies ConcreteTest<Iterable,JSequenceEnumeration> {
    
    String->Iterable construct(String->ArgumentList arguments)
            => "{``arguments.key``}"->Iterable(arguments.item);
    
    shared String->Iterable emptyIterable = construct(argumentList.emptyArgumentList);
    shared String->Iterable abcIterable = construct(argumentList.abcArgumentList);
    shared String->Iterable spreadTextIterable = construct(argumentList.spreadTextArgumentList);
    
    compile = compileIterable;
    fromCeylon = RedHatTransformer.transformIterable;
    toCeylon = iterableToCeylon;
    codes = [emptyIterable, abcIterable, spreadTextIterable];
}

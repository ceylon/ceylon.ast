import ceylon.ast.core {
    ArgumentList,
    Iterable
}
import ceylon.ast.redhat {
    RedHatTransformer,
    iterableToCeylon,
    parseIterable
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceEnumeration=SequenceEnumeration
    }
}

shared object iterable satisfies ConcreteTest<Iterable,JSequenceEnumeration> {
    
    String->Iterable construct(String->ArgumentList arguments)
            => "{``arguments.key``}" -> Iterable(arguments.item);
    
    shared String->Iterable emptyIterable = construct(argumentList.emptyArgumentList);
    shared String->Iterable abcIterable = construct(argumentList.abcArgumentList);
    shared String->Iterable spreadTextIterable = construct(argumentList.spreadTextArgumentList);
    
    parse = parseIterable;
    fromCeylon = RedHatTransformer.transformIterable;
    toCeylon = iterableToCeylon;
    codes = [emptyIterable, abcIterable, spreadTextIterable];
}

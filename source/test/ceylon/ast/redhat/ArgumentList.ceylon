import ceylon.ast.core {
    ArgumentList,
    Expression,
    SpreadArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    argumentListToCeylon,
    compileArgumentList
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequencedArgument=SequencedArgument
    }
}

shared object argumentList satisfies ConcreteTest<ArgumentList,JSequencedArgument> {
    
    String->ArgumentList construct(<String->Expression>[] listedArguments = [], <String->SpreadArgument>? sequenceArgument = null) {
        if (exists sequenceArgument) {
            if (nonempty listedArguments) {
                return "``",".join(listedArguments.collect(Entry<String,Expression>.key))``,``sequenceArgument.key``"->ArgumentList(listedArguments.collect(Entry<String,Expression>.item), sequenceArgument.item);
            } else {
                return sequenceArgument.key->ArgumentList([], sequenceArgument.item);
            }
        } else {
            return "``",".join(listedArguments.collect(Entry<String,Expression>.key))``"->ArgumentList(listedArguments.collect(Entry<String,Expression>.item));
        }
    }
    
    shared String->ArgumentList emptyArgumentList = construct();
    shared String->ArgumentList abcArgumentList = construct([baseExpression.aExpression, baseExpression.bExpression, baseExpression.cExpression]);
    shared String->ArgumentList spreadTextArgumentList = construct([], spreadArgument.spreadTextArgument);
    
    compile = compileArgumentList;
    fromCeylon = RedHatTransformer.transformArgumentList;
    toCeylon = argumentListToCeylon;
    codes = [emptyArgumentList, abcArgumentList, spreadTextArgumentList];
}

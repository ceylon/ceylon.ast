import ceylon.ast.core {
    ArgumentList,
    Comprehension,
    Expression,
    SpreadArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    argumentListToCeylon,
    parseArgumentList
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSequencedArgument=SequencedArgument
    }
}

shared object argumentList satisfies ConcreteTest<ArgumentList,JSequencedArgument> {
    
    String->ArgumentList construct(<String->Expression>[] listedArguments = [], <String->SpreadArgument|Comprehension>? sequenceArgument = null) {
        if (exists sequenceArgument) {
            if (nonempty listedArguments) {
                return "``",".join(listedArguments.collect(Entry<String,Expression>.key))``,``sequenceArgument.key``" -> ArgumentList(listedArguments.collect(Entry<String,Expression>.item), sequenceArgument.item);
            } else {
                return sequenceArgument.key -> ArgumentList([], sequenceArgument.item);
            }
        } else {
            return "``",".join(listedArguments.collect(Entry<String,Expression>.key))``" -> ArgumentList(listedArguments.collect(Entry<String,Expression>.item));
        }
    }
    
    shared String->ArgumentList emptyArgumentList = construct();
    shared String->ArgumentList abcArgumentList = construct([baseExpression.aExpression, baseExpression.bExpression, baseExpression.cExpression]);
    shared String->ArgumentList spreadTextArgumentList = construct([], spreadArgument.spreadTextArgument);
    shared String->ArgumentList comprehensionArgumentList = construct([], comprehension.forPersonInPeopleComprehension);
    
    // not tested directly, but used by other tests
    shared String->ArgumentList helloWorldArgumentList = construct([sumOperation.helloPlusNameElseWorldPlusBangExpression]);
    shared String->ArgumentList lucasArgumentList = construct([stringLiteral.lucasStringLiteral]);
    shared String->ArgumentList keyItemArgumentList = construct([baseExpression.keyExpression, baseExpression.itemExpression]);
    shared String->ArgumentList personNameArgumentList = construct([qualifiedExpression.personNameQualifiedExpression]);
    shared String->ArgumentList xySquaredSumArgumentList = construct([sumOperation.xySquaredSumExpression]);
    shared String->ArgumentList yxArgumentList = construct([baseExpression.yExpression, baseExpression.xExpression]);
    shared String->ArgumentList phiArgumentList = construct([baseExpression.phiExpression]);
    
    parse = parseArgumentList;
    fromCeylon = RedHatTransformer.transformArgumentList;
    toCeylon = argumentListToCeylon;
    codes = [emptyArgumentList, abcArgumentList, spreadTextArgumentList, comprehensionArgumentList];
}

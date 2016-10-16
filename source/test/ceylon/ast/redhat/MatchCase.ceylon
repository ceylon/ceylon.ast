import ceylon.ast.core {
    BaseExpression,
    CharacterLiteral,
    IntegerLiteral,
    MatchCase,
    NegationOperation,
    QualifiedExpression,
    StringLiteral,
    Tuple
}
import ceylon.ast.redhat {
    RedHatTransformer,
    matchCaseToCeylon,
    parseMatchCase
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMatchCase=MatchCase
    }
}

shared object matchCase satisfies ConcreteTest<MatchCase,JMatchCase> {
    
    String->MatchCase construct(<String->IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression|Tuple>+ expressions)
            => "``",".join(expressions*.key)``"->MatchCase(expressions*.item);
    
    shared String->MatchCase matchZeroOrOneCase = construct(integerLiteral._0IntegerLiteral, integerLiteral.oneIntegerLiteral);
    shared String->MatchCase matchNullCase = construct(baseExpression.nullExpression);
    shared String->MatchCase matchMinusOneCase = construct(negationOperation.minusOneExpression);
    shared String->MatchCase packageNullCase = construct(qualifiedExpression.packageNullExpression);
    shared String->MatchCase abcTupleCase = construct(tuple.abcTuple);
    
    parse = parseMatchCase;
    fromCeylon = RedHatTransformer.transformMatchCase;
    toCeylon = matchCaseToCeylon;
    codes = [matchZeroOrOneCase, matchNullCase, matchMinusOneCase, packageNullCase, abcTupleCase];
}

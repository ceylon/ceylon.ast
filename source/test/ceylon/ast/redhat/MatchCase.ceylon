import ceylon.ast.core {
    BaseExpression,
    CharacterLiteral,
    IntegerLiteral,
    MatchCase,
    NegationOperation,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    matchCaseToCeylon,
    compileMatchCase
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMatchCase=MatchCase
    }
}

shared object matchCase satisfies ConcreteTest<MatchCase,JMatchCase> {
    
    String->MatchCase construct(<String->IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression>+ expressions)
            => "``",".join(expressions*.key)``"->MatchCase(expressions*.item);
    
    shared String->MatchCase matchZeroOrOneCase = construct(integerLiteral._0IntegerLiteral, integerLiteral.oneIntegerLiteral);
    shared String->MatchCase matchNullCase = construct(baseExpression.nullExpression);
    shared String->MatchCase matchMinusOneCase = construct(negationOperation.minusOneExpression);
    
    compile = compileMatchCase;
    fromCeylon = RedHatTransformer.transformMatchCase;
    toCeylon = matchCaseToCeylon;
    codes = [matchZeroOrOneCase, matchNullCase, matchMinusOneCase];
}

import ceylon.ast.core {
    MatchCase,
    NegationOperation,
    BaseExpression,
    StringLiteral,
    IntegerLiteral,
    CharacterLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpression=Expression,
        JMatchCase=MatchCase
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[MatchCase|JMatchCase]] to a `ceylon.ast` [[MatchCase]]."
shared MatchCase matchCaseToCeylon(JMatchCase matchCase) {
    assert (nonempty expressions = CeylonIterable(matchCase.expressionList.expressions)
            .collect {
            IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression collecting(JExpression element) {
                assert (is IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression expression = expressionToCeylon(element));
                return expression;
            }
        });
    return MatchCase(expressions);
}

"Compiles the given [[code]] for a Match Case
 into a [[MatchCase]] using the Ceylon compiler
 (more specifically, the rule for a `matchCaseCondition`)."
shared MatchCase? compileMatchCase(String code) {
    if (exists jMatchCaseCondition = createParser(code).matchCaseCondition()) {
        return matchCaseToCeylon(jMatchCaseCondition);
    } else {
        return null;
    }
}

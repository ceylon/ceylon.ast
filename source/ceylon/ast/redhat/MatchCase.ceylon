import ceylon.ast.core {
    BaseExpression,
    IntegerLiteral,
    CharacterLiteral,
    MatchCase,
    NegationOperation,
    Node,
    QualifiedExpression,
    StringLiteral,
    Tuple
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExpression=Expression,
        JMatchCase=MatchCase
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[MatchCase|JMatchCase]] to a `ceylon.ast` [[MatchCase]]."
shared MatchCase matchCaseToCeylon(JMatchCase matchCase, Anything(JNode, Node) update = noop) {
    assert (nonempty expressions = CeylonIterable(matchCase.expressionList.expressions)
            .collect {
            IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression|Tuple collecting(JExpression element) {
                assert (is IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression|Tuple expression = expressionToCeylon(element, update));
                return expression;
            }
        });
    value result = MatchCase(expressions);
    update(matchCase, result);
    return result;
}

"Parses the given [[code]] for a Match Case
 into a [[MatchCase]] using the Ceylon compiler
 (more specifically, the rule for a `matchCaseCondition`)."
shared MatchCase? parseMatchCase(String code, Anything(JNode, Node) update = noop) {
    if (exists jMatchCaseCondition = createParser(code).matchCaseCondition()) {
        return matchCaseToCeylon(jMatchCaseCondition, update);
    } else {
        return null;
    }
}

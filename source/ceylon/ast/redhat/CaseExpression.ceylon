import ceylon.ast.core {
    CaseExpression,
    DisjoiningExpression,
    IfElseExpression,
    LetExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCaseClause=CaseClause
    }
}

"Converts a RedHat AST [[CaseClause|JCaseClause]] to a `ceylon.ast` [[CaseExpression]]."
CaseExpression caseExpressionToCeylon(JCaseClause caseExpression)
        => CaseExpression {
    caseItem = caseItemToCeylon(caseExpression.caseItem);
    value expression {
        value expression = expressionToCeylon(caseExpression.expression);
        assert (is DisjoiningExpression|IfElseExpression|LetExpression expression);
        return expression;
    }
};

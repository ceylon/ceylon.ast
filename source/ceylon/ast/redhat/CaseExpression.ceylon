import ceylon.ast.core {
    CaseExpression,
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCaseClause=CaseClause
    }
}

"Converts a RedHat AST [[CaseClause|JCaseClause]] to a `ceylon.ast` [[CaseExpression]]."
shared CaseExpression caseExpressionToCeylon(JCaseClause caseExpression, Anything(JNode,Node) update = noop) {
    value result = CaseExpression {
        caseItem = caseItemToCeylon(caseExpression.caseItem, update);
        value expression {
            value expression = expressionToCeylon(caseExpression.expression, update);
            assert (is DisjoiningExpression|IfElseExpression|LetExpression expression);
            return expression;
        }
    };
    update(caseExpression, result);
    return result;
}

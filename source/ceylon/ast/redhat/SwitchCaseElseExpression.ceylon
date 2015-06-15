import ceylon.ast.core {
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    Node,
    SwitchCaseElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSwitchExpression=SwitchExpression
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[SwitchExpression|JSwitchExpression]] to a `ceylon.ast` [[SwitchCaseElseExpression]]."
shared SwitchCaseElseExpression switchCaseElseExpressionToCeylon(JSwitchExpression switchCaseElseExpression, Anything(JNode,Node) update = noop) {
    assert (nonempty caseClauses = CeylonIterable(switchCaseElseExpression.switchCaseList.caseClauses).collect(propagateUpdate(caseExpressionToCeylon, update)));
    DisjoiningExpression|IfElseExpression|LetExpression? elseExpression;
    if (exists jElseClause = switchCaseElseExpression.switchCaseList.elseClause) {
        assert (is DisjoiningExpression|IfElseExpression|LetExpression expr = expressionToCeylon(jElseClause.expression, update));
        elseExpression = expr;
    } else {
        elseExpression = null;
    }
    value result = SwitchCaseElseExpression(switchClauseToCeylon(switchCaseElseExpression.switchClause, update), caseClauses, elseExpression);
    update(switchCaseElseExpression, result);
    return result;
}

"Compiles the given [[code]] for a Switch Case Else Expression
 into a [[SwitchCaseElseExpression]] using the Ceylon compiler
 (more specifically, the rule for a `switchExpression`)."
shared SwitchCaseElseExpression? compileSwitchCaseElseExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jSwitchExpression = createParser(code).switchExpression()) {
        return switchCaseElseExpressionToCeylon(jSwitchExpression, update);
    } else {
        return null;
    }
}

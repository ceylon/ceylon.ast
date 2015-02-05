import ceylon.ast.core {
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    SwitchCaseElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchExpression=SwitchExpression
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[SwitchExpression|JSwitchExpression]] to a `ceylon.ast` [[SwitchCaseElseExpression]]."
shared SwitchCaseElseExpression switchCaseElseExpressionToCeylon(JSwitchExpression switchCaseElseExpression) {
    assert (nonempty caseClauses = CeylonIterable(switchCaseElseExpression.switchCaseList.caseClauses).collect(caseExpressionToCeylon));
    DisjoiningExpression|IfElseExpression|LetExpression? elseExpression;
    if (exists jElseClause = switchCaseElseExpression.switchCaseList.elseClause) {
        assert (is DisjoiningExpression|IfElseExpression|LetExpression expr = expressionToCeylon(jElseClause.expression));
        elseExpression = expr;
    } else {
        elseExpression = null;
    }
    return SwitchCaseElseExpression(switchClauseToCeylon(switchCaseElseExpression.switchClause), caseClauses, elseExpression);
}

"Compiles the given [[code]] for a Switch Case Else Expression
 into a [[SwitchCaseElseExpression]] using the Ceylon compiler
 (more specifically, the rule for a `switchExpression`)."
shared SwitchCaseElseExpression? compileSwitchCaseElseExpression(String code) {
    if (exists jSwitchExpression = createParser(code).switchExpression()) {
        return switchCaseElseExpressionToCeylon(jSwitchExpression);
    } else {
        return null;
    }
}

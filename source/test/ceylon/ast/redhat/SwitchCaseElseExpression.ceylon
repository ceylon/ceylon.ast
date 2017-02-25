import ceylon.ast.core {
    CaseExpression,
    DisjoiningExpression,
    IfElseExpression,
    LetExpression,
    SwitchCaseElseExpression,
    SwitchClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    switchCaseElseExpressionToCeylon,
    parseSwitchCaseElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchExpression=SwitchExpression
    }
}

shared object switchCaseElseExpression satisfies ConcreteTest<SwitchCaseElseExpression,JSwitchExpression> {
    
    String->SwitchCaseElseExpression construct(String->SwitchClause clause, [<String->CaseExpression>+] caseExpressions, <String->DisjoiningExpression|IfElseExpression|LetExpression>? elseExpression = null)
            => "``clause.key`` ``" ".join(caseExpressions*.key)`` ``(if (exists elseExpression) then "else ``elseExpression.key``" else "")``" -> SwitchCaseElseExpression(clause.item, caseExpressions*.item, elseExpression?.item);
    
    shared String->SwitchCaseElseExpression switchCaseElseExpression = construct(switchClause.switchIClause, ["case (0 | 1) i" -> CaseExpression(matchCase.matchZeroOrOneCase.item, baseExpression.iExpression.item)], baseExpression.nullExpression);
    
    parse = parseSwitchCaseElseExpression;
    fromCeylon = RedHatTransformer.transformSwitchCaseElseExpression;
    toCeylon = switchCaseElseExpressionToCeylon;
    codes = [switchCaseElseExpression];
}

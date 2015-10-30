import ceylon.ast.core {
    CaseClause,
    ElseClause,
    SwitchCases
}
import ceylon.ast.redhat {
    RedHatTransformer,
    switchCasesToCeylon,
    compileSwitchCases
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchCaseList=SwitchCaseList
    }
}

shared object switchCases satisfies ConcreteTest<SwitchCases,JSwitchCaseList> {
    
    String->SwitchCases construct([<String->CaseClause>+] caseClauses, <String->ElseClause>? elseClause)
            => "``"\n".join(caseClauses*.key)``\n`` elseClause?.key else "" ``"->SwitchCases(caseClauses*.item, elseClause?.item);
    
    shared String->SwitchCases switchCases = construct([caseClause.caseIsStringClause, caseClause.caseNullPrintHelloWorldClause], elseClause.elsePrintHelloWorldClause);
    shared String->SwitchCases switchElseIfCases = construct([caseClause.caseIsStringClause, caseClause.caseNullPrintHelloWorldClause], elseClause.emptyElseIfClause);
    
    compile = compileSwitchCases;
    fromCeylon = RedHatTransformer.transformSwitchCases;
    toCeylon = switchCasesToCeylon;
    codes = [switchCases, switchElseIfCases];
}

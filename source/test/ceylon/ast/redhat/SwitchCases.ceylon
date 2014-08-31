import ceylon.ast.core {
    CaseClause,
    ElseCaseClause,
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
    
    String->SwitchCases construct([<String->CaseClause>+] caseClauses, <String->ElseCaseClause>? elseCaseClause)
            => "``"\n".join(caseClauses*.key)``\n`` elseCaseClause?.key else "" ``"->SwitchCases(caseClauses*.item, elseCaseClause?.item);
    
    shared String->SwitchCases switchCases = construct([caseClause.caseIsStringClause, caseClause.caseNullPrintHelloWorldClause], elseCaseClause.elsePrintHelloWorldCaseClause);
    
    compile = compileSwitchCases;
    fromCeylon = RedHatTransformer.transformSwitchCases;
    toCeylon = switchCasesToCeylon;
    codes = [switchCases];
}

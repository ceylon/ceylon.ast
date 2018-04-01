import ceylon.ast.core {
    Block,
    CaseClause,
    CaseItem
}
import ceylon.ast.redhat {
    RedHatTransformer,
    caseClauseToCeylon,
    parseCaseClause
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JCaseClause=CaseClause
    }
}

shared object caseClause satisfies ConcreteTest<CaseClause,JCaseClause> {
    
    String->CaseClause construct(String->CaseItem caseItem, String->Block block, Boolean elseCase = false)
            => "`` elseCase then "else " else "" ``case (``caseItem.key``) ``block.key``" -> CaseClause(caseItem.item, block.item, elseCase);
    
    shared String->CaseClause caseNullPrintHelloWorldClause = construct(matchCase.matchNullCase, block.printHelloWorldBlock);
    shared String->CaseClause caseIsStringClause = construct(isCase.isStringCase, block.emptyBlock);
    shared String->CaseClause elseCaseIsStringClause = construct(isCase.isStringCase, block.emptyBlock, true);
    
    parse = parseCaseClause;
    fromCeylon = RedHatTransformer.transformCaseClause;
    toCeylon = caseClauseToCeylon;
    codes = [caseNullPrintHelloWorldClause, caseIsStringClause, elseCaseIsStringClause];
}

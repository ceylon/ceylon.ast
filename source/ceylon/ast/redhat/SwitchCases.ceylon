import ceylon.ast.core {
    ElseCaseClause,
    SwitchCases
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchCaseList=SwitchCaseList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[SwitchCaseList|JSwitchCaseList]] to a `ceylon.ast` [[SwitchCases]]."
shared SwitchCases switchCasesToCeylon(JSwitchCaseList switchCases) {
    assert (nonempty caseClauses = CeylonIterable(switchCases.caseClauses).collect(caseClauseToCeylon));
    ElseCaseClause? elseCaseClause;
    if (exists jElseClause = switchCases.elseClause) {
        elseCaseClause = elseCaseClauseToCeylon(jElseClause);
    } else {
        elseCaseClause = null;
    }
    return SwitchCases(caseClauses, elseCaseClause);
}

"Compiles the given [[code]] for Switch Cases
 into [[SwitchCases]] using the Ceylon compiler
 (more specifically, the rule for `cases`)."
shared SwitchCases? compileSwitchCases(String code) {
    if (exists jCases = createParser(code).cases()) {
        return switchCasesToCeylon(jCases);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ElseClause,
    Node,
    SwitchCases
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSwitchCaseList=SwitchCaseList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[SwitchCaseList|JSwitchCaseList]] to a `ceylon.ast` [[SwitchCases]]."
shared SwitchCases switchCasesToCeylon(JSwitchCaseList switchCases, Anything(JNode, Node) update = noop) {
    assert (nonempty caseClauses = CeylonIterable(switchCases.caseClauses).collect(propagateUpdate(caseClauseToCeylon, update)));
    ElseClause? elseClause;
    if (exists jElseClause = switchCases.elseClause) {
        elseClause = elseClauseToCeylon(jElseClause, update);
    } else {
        elseClause = null;
    }
    value result = SwitchCases(caseClauses, elseClause);
    update(switchCases, result);
    return result;
}

"Parses the given [[code]] for Switch Cases
 into [[SwitchCases]] using the Ceylon compiler
 (more specifically, the rule for `cases`)."
shared SwitchCases? parseSwitchCases(String code, Anything(JNode, Node) update = noop) {
    if (exists jCases = createParser(code).cases()) {
        return switchCasesToCeylon(jCases, update);
    } else {
        return null;
    }
}

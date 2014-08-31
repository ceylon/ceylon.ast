import ceylon.ast.core {
    SwitchCaseElse
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchStatement=SwitchStatement
    }
}

"Converts a RedHat AST [[SwitchStatement|JSwitchStatement]] to a `ceylon.ast` [[SwitchCaseElse]]."
shared SwitchCaseElse switchCaseElseToCeylon(JSwitchStatement switchCaseElse) {
    return SwitchCaseElse(switchClauseToCeylon(switchCaseElse.switchClause), switchCasesToCeylon(switchCaseElse.switchCaseList));
}

"Compiles the given [[code]] for a Switch Case Else
 into a [[SwitchCaseElse]] using the Ceylon compiler
 (more specifically, the rule for a `switchCaseElse`)."
shared SwitchCaseElse? compileSwitchCaseElse(String code) {
    if (exists jSwitchCaseElse = createParser(code).switchCaseElse()) {
        return switchCaseElseToCeylon(jSwitchCaseElse);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    Node,
    SwitchCaseElse
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSwitchStatement=SwitchStatement
    }
}

"Converts a RedHat AST [[SwitchStatement|JSwitchStatement]] to a `ceylon.ast` [[SwitchCaseElse]]."
shared SwitchCaseElse switchCaseElseToCeylon(JSwitchStatement switchCaseElse, Anything(JNode, Node) update = noop) {
    value result = SwitchCaseElse(switchClauseToCeylon(switchCaseElse.switchClause, update), switchCasesToCeylon(switchCaseElse.switchCaseList, update));
    update(switchCaseElse, result);
    return result;
}

"Parses the given [[code]] for a Switch Case Else
 into a [[SwitchCaseElse]] using the Ceylon compiler
 (more specifically, the rule for a `switchCaseElse`)."
shared SwitchCaseElse? parseSwitchCaseElse(String code, Anything(JNode, Node) update = noop) {
    if (exists jSwitchCaseElse = createParser(code).switchCaseElse()) {
        return switchCaseElseToCeylon(jSwitchCaseElse, update);
    } else {
        return null;
    }
}

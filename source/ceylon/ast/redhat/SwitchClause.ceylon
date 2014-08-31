import ceylon.ast.core {
    SwitchClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchClause=SwitchClause
    }
}

"Converts a RedHat AST [[SwitchClause|JSwitchClause]] to a `ceylon.ast` [[SwitchClause]]."
shared SwitchClause switchClauseToCeylon(JSwitchClause switchClause) {
    return SwitchClause(expressionToCeylon(switchClause.expression));
}

"Compiles the given [[code]] for a Switch Clause
 into a [[SwitchClause]] using the Ceylon compiler
 (more specifically, the rule for a `switchHeader`)."
shared SwitchClause? compileSwitchClause(String code) {
    if (exists jSwitchHeader = createParser(code).switchHeader()) {
        return switchClauseToCeylon(jSwitchHeader);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    IfClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfClause=IfClause
    }
}

"Converts a RedHat AST [[IfClause|JIfClause]] to a `ceylon.ast` [[IfClause]]."
shared IfClause ifClauseToCeylon(JIfClause ifClause) {
    return IfClause(conditionListToCeylon(ifClause.conditionList), blockToCeylon(ifClause.block));
}

"Compiles the given [[code]] for an If Clause
 into an [[IfClause]] using the Ceylon compiler
 (more specifically, the rule for an `ifBlock`)."
shared IfClause? compileIfClause(String code) {
    if (exists jIfBlock = createParser(code).ifBlock()) {
        return ifClauseToCeylon(jIfBlock);
    } else {
        return null;
    }
}

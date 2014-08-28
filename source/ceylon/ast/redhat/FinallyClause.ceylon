import ceylon.ast.core {
    FinallyClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFinallyClause=FinallyClause
    }
}

"Converts a RedHat AST [[FinallyClause|JFinallyClause]] to a `ceylon.ast` [[FinallyClause]]."
shared FinallyClause finallyClauseToCeylon(JFinallyClause finallyClause) {
    return FinallyClause(blockToCeylon(finallyClause.block));
}

"Compiles the given [[code]] for a Finally Clause
 into a [[FinallyClause]] using the Ceylon compiler
 (more specifically, the rule for a `finallyBlock`)."
shared FinallyClause? compileFinallyClause(String code) {
    if (exists jFinallyBlock = createParser(code).finallyBlock()) {
        return finallyClauseToCeylon(jFinallyBlock);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ForClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForClause=ForClause
    }
}

"Converts a RedHat AST [[ForClause|JForClause]] to a `ceylon.ast` [[ForClause]]."
shared ForClause forClauseToCeylon(JForClause forClause) {
    return ForClause(forIteratorToCeylon(forClause.forIterator), blockToCeylon(forClause.block));
}

"Compiles the given [[code]] for a ‘`for`’ Clause
 into a [[ForClause]] using the Ceylon compiler
 (more specifically, the rule for a `forBlock`)."
shared ForClause? compileForClause(String code) {
    if (exists jForBlock = createParser(code).forBlock()) {
        return forClauseToCeylon(jForBlock);
    } else {
        return null;
    }
}

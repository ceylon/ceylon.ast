import ceylon.ast.core {
    FailClause,
    ForFail
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForStatement=ForStatement
    }
}

"Converts a RedHat AST [[ForStatement|JForStatement]] to a `ceylon.ast` [[ForFail]]."
shared ForFail forFailToCeylon(JForStatement forFail) {
    FailClause? failClause;
    if (exists jElseClause = forFail.elseClause) {
        failClause = failClauseToCeylon(jElseClause);
    } else {
        failClause = null;
    }
    return ForFail(forClauseToCeylon(forFail.forClause), failClause);
}

"Compiles the given [[code]] for a ‘`for`’ loop
 into a [[ForFail]] using the Ceylon compiler
 (more specifically, the rule for a `forElse`)."
shared ForFail? compileForFail(String code) {
    if (exists jForElse = createParser(code).forElse()) {
        return forFailToCeylon(jForElse);
    } else {
        return null;
    }
}

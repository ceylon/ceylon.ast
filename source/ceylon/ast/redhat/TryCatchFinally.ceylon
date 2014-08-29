import ceylon.ast.core {
    FinallyClause,
    TryCatchFinally
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTryCatchStatement=TryCatchStatement
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TryCatchFinally|JTryCatchStatement]] to a `ceylon.ast` [[TryCatchFinally]]."
shared TryCatchFinally tryCatchFinallyToCeylon(JTryCatchStatement tryCatchFinally) {
    FinallyClause? finallyClause;
    if (exists jFinallyClause = tryCatchFinally.finallyClause) {
        finallyClause = finallyClauseToCeylon(jFinallyClause);
    } else {
        finallyClause = null;
    }
    return TryCatchFinally {
        tryClause = tryClauseToCeylon(tryCatchFinally.tryClause);
        catchClauses = CeylonIterable(tryCatchFinally.catchClauses).collect(catchClauseToCeylon);
        finallyClause = finallyClause;
    };
}

"Compiles the given [[code]] for a Try Catch Finally
 into a [[TryCatchFinally]] using the Ceylon compiler
 (more specifically, the rule for a `tryCatchFinally`)."
shared TryCatchFinally? compileTryCatchFinally(String code) {
    if (exists jTryCatchFinally = createParser(code).tryCatchFinally()) {
        return tryCatchFinallyToCeylon(jTryCatchFinally);
    } else {
        return null;
    }
}

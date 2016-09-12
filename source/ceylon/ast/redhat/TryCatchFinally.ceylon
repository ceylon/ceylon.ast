import ceylon.ast.core {
    FinallyClause,
    Node,
    TryCatchFinally
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTryCatchStatement=TryCatchStatement
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TryCatchFinally|JTryCatchStatement]] to a `ceylon.ast` [[TryCatchFinally]]."
shared TryCatchFinally tryCatchFinallyToCeylon(JTryCatchStatement tryCatchFinally, Anything(JNode,Node) update = noop) {
    FinallyClause? finallyClause;
    if (exists jFinallyClause = tryCatchFinally.finallyClause) {
        finallyClause = finallyClauseToCeylon(jFinallyClause, update);
    } else {
        finallyClause = null;
    }
    value result = TryCatchFinally {
        tryClause = tryClauseToCeylon(tryCatchFinally.tryClause, update);
        catchClauses = CeylonIterable(tryCatchFinally.catchClauses).collect(propagateUpdate(catchClauseToCeylon, update));
        finallyClause = finallyClause;
    };
    update(tryCatchFinally, result);
    return result;
}

"Parses the given [[code]] for a Try Catch Finally
 into a [[TryCatchFinally]] using the Ceylon compiler
 (more specifically, the rule for a `tryCatchFinally`)."
shared TryCatchFinally? parseTryCatchFinally(String code, Anything(JNode,Node) update = noop) {
    if (exists jTryCatchFinally = createParser(code).tryCatchFinally()) {
        return tryCatchFinallyToCeylon(jTryCatchFinally, update);
    } else {
        return null;
    }
}

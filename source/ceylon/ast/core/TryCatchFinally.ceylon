"A try-cA try/catch/finally statement, that is,
 a [[‘`try`’ clause|tryClause]], followed by any amount of [[‘`catch`’ clauses|catchClauses]], and optionally terminated by a [[‘`finally`’ clause|finallyClause]].
 
 Examples (multi-line):
 
     // removing a non-critical entity, e. g. when running low on resources
     try (writer = file.Writer()) {
         that.serialize(writer);
     } finally {
         despawn(that);
     }
 
     // a compilation controller
     try (lock) {
         compilationUnit.compile(this);
     } catch (CancellationException e) {
         // ignore
     } catch (otherException) {
         log(otherException);
         compilationUnit.compiled = false;
     }"
shared class TryCatchFinally(tryClause, catchClauses = [], finallyClause = null)
        extends ControlStructure() {
    
    "The ‘`try`’ clause."
    shared TryClause tryClause;
    "The ‘`catch`’ clauses, if any.
     
     If an exception propagated out of the [[`try` block|TryClause.block]],
     the first [[`catch` block|CatchClause.block]] with a matching [[variable|CatchClause.variable]]
     is executed."
    shared CatchClause[] catchClauses;
    "The ‘`finally`’ clause, if present.
     
     The [[`finally` block|FinallyClause.block]] is executed last,
     even if an exception propagates out of the entire construct."
    shared FinallyClause? finallyClause;
    
    shared actual [TryClause, CatchClause|FinallyClause*] children = [tryClause, *concatenate(catchClauses, emptyOrSingleton(finallyClause))];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTryCatchFinally(this);
    
    shared actual Boolean equals(Object that) {
        if (is TryCatchFinally that) {
            if (exists finallyClause) {
                if (exists finallyClause_ = that.finallyClause) {
                    if (finallyClause != finallyClause_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.finallyClause exists) {
                return false;
            }
            return tryClause == that.tryClause && catchClauses == that.catchClauses;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (tryClause.hash + 31 * (catchClauses.hash + 31 * (finallyClause?.hash else 0)));
    
    shared TryCatchFinally copy(TryClause tryClause = this.tryClause, CatchClause[] catchClauses = this.catchClauses, FinallyClause? finallyClause = this.finallyClause) {
        value ret = TryCatchFinally(tryClause, catchClauses, finallyClause);
        copyExtraInfoTo(ret);
        return ret;
    }
}

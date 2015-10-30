"A list of ‘`case`’ clauses (with an optional trailing ‘`else`’ clause)
 for a [[`switch` statement|SwitchCaseElse]].
 
 Examples (multi-line):
 
     case (is Block) { return transformBlock(that); }
     case (is IfElse) { return transformIfElse(that); }
 
     case (0 | 1) { return false; }
     case (2) { return true; }
     else {
         return i % 2 == 1 && expensivePrimeTest(i);
     }"
shared class SwitchCases(caseClauses, elseClause = null)
        extends Node() {
    
    "The `case` clauses."
    shared [CaseClause+] caseClauses;
    "The `else` clause, if present."
    shared ElseClause? elseClause;
    
    assert (nonempty children_ = concatenate(caseClauses, emptyOrSingleton(elseClause)));
    shared actual [<CaseClause|ElseClause>+] children = children_;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSwitchCases(this);
    
    shared actual Boolean equals(Object that) {
        if (is SwitchCases that) {
            if (exists elseClause) {
                if (exists elseClause_ = that.elseClause) {
                    if (elseClause != elseClause_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.elseClause exists) {
                return false;
            }
            return caseClauses == that.caseClauses;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (caseClauses.hash + 31 * (elseClause?.hash else 0));
    
    shared SwitchCases copy([CaseClause+] caseClauses = this.caseClauses, ElseClause? elseClause = this.elseClause) {
        value ret = SwitchCases(caseClauses, elseClause);
        copyExtraInfoTo(ret);
        return ret;
    }
}

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
shared class SwitchCases(caseClauses, elseCaseClause = null)
        extends Node() {
    
    "The `case` clauses."
    shared [CaseClause+] caseClauses;
    "The `else` clause, if present."
    shared ElseCaseClause? elseCaseClause;
    
    assert (nonempty children_ = concatenate(caseClauses, emptyOrSingleton(elseCaseClause)));
    shared actual [<CaseClause|ElseCaseClause>+] children = children_;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSwitchCases(this);
    
    shared actual Boolean equals(Object that) {
        if (is SwitchCases that) {
            if (exists elseCaseClause) {
                if (exists elseCaseClause_ = that.elseCaseClause) {
                    return elseCaseClause == elseCaseClause_ && caseClauses == that.caseClauses;
                } else {
                    return false;
                }
            } else {
                if (!(that.elseCaseClause exists)) {
                    return caseClauses == that.caseClauses;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (caseClauses.hash + 31 * (elseCaseClause?.hash else 0));
    
    shared SwitchCases copy([CaseClause+] caseClauses = this.caseClauses, ElseCaseClause? elseCaseClause = this.elseCaseClause) {
        value ret = SwitchCases(caseClauses, elseCaseClause);
        copyExtraInfoTo(ret);
        return ret;
    }
}

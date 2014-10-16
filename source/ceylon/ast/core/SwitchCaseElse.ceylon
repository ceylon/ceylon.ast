"A `switch`/`case`/`else` statement, that is,
 a [[`switch` clause|clause]], followed by [[cases]].
 
 Examples (multi-line):
 
     switch (i.magnitude)
     case (0 | 1) { return false; }
     case (2) { return true; }
     else {
         return i % 2 == 1 && expensivePrimeTest(i);
     }
 
     switch (that)
     case (is Block) { return transformBlock(that); }
     case (is IfElse) { return transformIfElse(that); }"
shared class SwitchCaseElse(clause, cases)
        extends ControlStructure() {
    
    "The `switch` clause."
    shared SwitchClause clause;
    "The cases."
    shared SwitchCases cases;
    
    shared actual [SwitchClause, SwitchCases] children = [clause, cases];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSwitchCaseElse(this);
    
    shared actual Boolean equals(Object that) {
        if (is SwitchCaseElse that) {
            return clause == that.clause && cases == that.cases;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (clause.hash + 31 * cases.hash);
    
    shared SwitchCaseElse copy(SwitchClause clause = this.clause, SwitchCases cases = this.cases) {
        value ret = SwitchCaseElse(clause, cases);
        copyExtraInfoTo(ret);
        return ret;
    }
}

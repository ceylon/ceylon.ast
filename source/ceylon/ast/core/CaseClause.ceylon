"A ‘`case`’ clause of a [[‘`switch`’ statement|SwitchCaseElse]], that is,
 the keyword ‘`case`’, followed by a [[case item|caseItem]] enclosed in parentheses and a [[block]].
 
 Examples (multi-line):
 
     case (is String) {
         int = parseInteger(val);
     }
 
     case (null) { return; }"
shared class CaseClause(caseItem, block)
        extends Node() {
    
    "The case item for this clause."
    shared CaseItem caseItem;
    "The block for this clause.
     
     The block is entered if the [[case item|caseItem]] matches
     the [[`switch` expression|SwitchClause.expression]]."
    shared Block block;
    
    shared actual [CaseItem, Block] children = [caseItem, block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCaseClause(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCaseClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is CaseClause that) {
            return caseItem==that.caseItem && block==that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (caseItem.hash + 31*block.hash);
    
    shared CaseClause copy(CaseItem caseItem = this.caseItem, Block block = this.block) {
        value ret = CaseClause(caseItem, block);
        copyExtraInfoTo(ret);
        return ret;
    }
}

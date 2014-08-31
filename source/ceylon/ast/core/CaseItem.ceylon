"A ‘`case`’ item from a [[‘`case`’ clause|CaseClause]].
 
 Examples:
 
     is String
     0, 1"
shared abstract class CaseItem()
        of MatchCase | IsCase
        extends Node() {
}

"A pattern declares one or multiple *variables*.     
 Destructuring statements, assertions, and some control structures can instantiate the pattern,
 possibly *destructuring* the original value in the process.
 
 The simplest and most common form is the [[VariablePattern]].
 
 Examples:
 
     e
     String line
     k->v
     [first, *rest]
     name->[lat, lon]"
shared abstract class Pattern()
        of VariablePattern | TuplePattern | EntryPattern
        extends Node() {
}

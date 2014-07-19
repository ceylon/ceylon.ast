"An argument list that can be used in an [[Invocation]].
 
 Not to be confused with [[ArgumentList]]. An `ArgumentList` is just
 a comma-separated list of arguments with an optional trailing sequential
 argument. `Arguments` either simply wrap an `ArgumentList` in parentheses
 ([[PositionalArguments]]), or can also add named arguments ([[NamedArguments]]).
 
 Examples:
 
     (x, y, *messages)
     ()
     (for (i in 1..10) i^2)
     { factor = 2.1; *actors }"
shared abstract class Arguments()
        of PositionalArguments
        extends ExpressionIsh() {
}

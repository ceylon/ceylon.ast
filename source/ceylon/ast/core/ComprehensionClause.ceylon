"A comprehension clause, one component of a [[Comprehension]].
 
 Examples:
 
     for (person in people) if (person.age > 18) person.age
     if (isPrime(i)) i"
shared abstract class ComprehensionClause()
        of ExpressionComprehensionClause
        extends Node() {
}

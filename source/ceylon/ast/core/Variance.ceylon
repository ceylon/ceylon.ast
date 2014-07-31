"A modifier that indicates type parameter / argument variance.
 
 Examples:
 
     in
     out" // yeah
shared abstract class Variance()
        of InModifier | OutModifier
        extends Modifier() {
}

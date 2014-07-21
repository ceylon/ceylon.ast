"A class, method, or function parameter.
 
 Examples:
 
     String name
     comparing
     Integer length = text.size
     Element+ elements"
shared abstract class Parameter()
        of RequiredParameter | DefaultedParameter
        extends Node() {
}

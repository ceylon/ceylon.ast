"A required parameter (neither defaulted nor variadic).
 
 Examples:
 
     String name
     comparing"
shared abstract class RequiredParameter()
        of ValueParameter | CallableParameter | ParameterReference
        extends Parameter() {
}

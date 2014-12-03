"A parameter list.
 
 Examples:
 
     ()
     (String text, Integer length = text.size)
     (Element+ elements)
 
 ### A note about this class’ parameters
 
 It would seem reasonable to instead declare the parameters of this class like this:
 
     class Parameters(RequiredParameter[] required,
         DefaultedParameter[] defaulted,
         VariadicParameter|ParameterReference variadic)
 
 Note that `variadic` must have the type `VariadicParameter|ParameterReference`, not just `VariadicParameter`,
 because a variadic parameter can also be just a reference, and declared in the body of the function or class.
 And this is where the problem comes in:
 
     (param)
 
 In this parameter list, is `param` a required or a defaulted parameter?
 In other words, is this
 
 - a `Parameters { required = [param]; }`, or
 - a `Parameters { variadic = param; }`?
 
 To decide this, you need to look into the body of the function,
 and check if the declaration of `param` has a regular or a variadic type.
 This is a semantical distinction, not a syntactical one,
 and in general we can’t expect tools that operate on an AST
 to be able to make this distinction.
 
 Instead, we have just one list of parameters; the separation into required,
 defaulted, and variadic ones may then be done in later stages of AST processing."
shared class Parameters(parameters = [])
        extends Node() {
    
    "The parameters."
    shared Parameter[] parameters;
    
    shared actual Parameter[] children = parameters;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformParameters(this);
    
    shared actual Boolean equals(Object that) {
        if (is Parameters that) {
            return parameters == that.parameters;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * parameters.hash;
    
    shared Parameters copy(Parameter[] parameters = this.parameters) {
        value ret = Parameters(parameters);
        copyExtraInfoTo(ret);
        return ret;
    }
}

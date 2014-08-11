"""A control directive, terminated by a semicolon.
   
   There are four kinds of control directives:
   - the [[`return`|Return]] directive, to return a value or terminate execution,
   - the [[`throw`|Throw]] directive, to raise an exception,
   - the [[`break`|Break]] directive, to terminate a loop, and
   - the [[`continue`|Continue]] directive, to jump to the next iteration of a loop.
   
   Examples:
   
       return ret;
       throw AssertionError("Not implemented yet!"); // TODO implement
       break;
       continue;"""
shared abstract class Directive()
        of Return | Throw | Break | Continue
        extends Statement() {
    
    "The expression that the surrounding function results in,
     if this directive ends execution of a surrounding function.
     
     - For a [[`return`|Return]] directive, this is the returned value’s expression, if any.
     - For a [[`throw`|Return]] directive, this is the raised exception’s expression, if any.
     - For a [[`break`|Break]] or [[`continue`|Continue]] directive, this is always [[null]]."
    shared formal Expression? result;
    
    "The text of the directive itself.
     
     (Does not include the [[result]] or the terminating semicolon.)"
    shared formal String text;
    
    shared actual formal [Expression=] children;
}

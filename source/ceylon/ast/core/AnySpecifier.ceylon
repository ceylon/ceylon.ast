"An [[eager|Specifier]] or [[lazy|LazySpecifier]] expression specifier.
 
 Examples:
 
     = 1
     => text.uppercased"
shared abstract class AnySpecifier()
        of Specifier | LazySpecifier
        extends ExpressionIsh() {
    
    "The specified expression."
    shared formal Expression expression;
    
    shared actual [Expression] children => [expression];
}

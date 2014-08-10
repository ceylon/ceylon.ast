"""An expression statement, that is, an expression terminated by a semicolon.
   
   Only certain expressions are valid statements:
   - [[assignment|AssignmentOperation]] (but see below),
   - [[prefix|PrefixOperation]] or [[postfix|PostfixOperation]] increment or decrement, and
   - [[invocation|Invocation]] (or instantiation).
   
   Be aware that very simple assignments are [[specifications|Specification]];
   an [[AssignmentStatement]] where the [[target|AssignOperation.target]] of the [[AssignOperation]]
   is a [[BaseExpression]] is invalid.
   
   Examples:
   
       text.length += added.length;
       i++;
       print("Hello, World!");"""
shared abstract class ExpressionStatement()
        of AssignmentStatement | PrefixPostfixStatement | InvocationStatement
        extends Statement() {
    
    "The expression of the statement."
    shared formal AssignmentOperation|PrefixOperation|PostfixOperation|Invocation expression;
    
    shared actual formal [AssignmentOperation|PrefixOperation|PostfixOperation|Invocation] children;
}

"""A function declaration or definition.
   
   If the [[definition]] is [[missing|null]] or a [[specifier|AnySpecifier]], then the statement
   must be terminated by a semicolon; if it’s a [[Block]], the semicolon is not necessary.
   
   Examples:
   
       shared formal Boolean equals(Object that);
       function compareByLength({Anything*} first, {Anything*} second) => first.length.compare(second.length);
       shared void run() {
           print("Hello, `` process.arguments.first else "World" ``!");"""
shared abstract class AnyFunction()
        of FunctionDeclaration | FunctionDefinition
        extends TypedDeclaration() {
    
    shared actual formal Type|FunctionModifier|DynamicModifier|VoidModifier type;
    "The parameter lists.
     A function must have at least one,
     but may also have several parameter lists."
    shared formal [Parameters+] parameterLists;
    "The type parameters of the function,
     if any."
    shared formal TypeParameters? typeParameters;
    "The type constraints placed upon the function’s
     [[type parameters|typeParameters]], if any."
    shared formal TypeConstraint[] typeConstraints;
    
    shared actual formal [Annotations, Type|FunctionModifier|DynamicModifier|VoidModifier, LIdentifier, TypeParameters|TypeConstraint|Block*] children;
}

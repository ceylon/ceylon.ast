"""A function declaration or definition.
   
   If the [[definition]] is [[missing|null]] or a [[specifier|AnySpecifier]], then the statement
   must be terminated by a semicolon; if it’s a [[Block]], the semicolon is not necessary.
   
   Examples:
   
       shared formal Boolean equals(Object that);
       function compareByLength({Anything*} first, {Anything*} second) => first.length.compare(second.length);
       shared void run() {
           print("Hello, `` process.arguments.first else "World" ``!");"""
shared abstract class AnyFunction()
        of FunctionDeclaration | FunctionDefinition | FunctionShortcutDefinition
        extends TypedDeclaration() {
    
    "The function name."
    shared actual formal MemberName name;
    "The type of the function.
     
     This can be:
     - a [[Type]],
     - a [[‘`void`’ modifier|VoidModifier]] for a function that does not return a value,
     - a [[‘`function`’ modifier|FunctionModifier]] for a function with inferred type,
     - a [[‘`dynamic’` modifier|DynamicModifier]] for a dynamically typed function.
     
     (A [[function declaration|FunctionDeclaration]] without definition may not use
     a ‘`function`’ modifier, as wtihout a definition no type can be inferred.)"
    shared actual formal Type|FunctionModifier|DynamicModifier|VoidModifier type;
    "The parameter lists.
     A function must have at least one,
     but may also have several parameter lists."
    shared formal [Parameters+] parameterLists;
    "The function definition."
    shared actual formal Block|LazySpecifier? definition;
    "The type parameters of the function,
     if any."
    shared formal TypeParameters? typeParameters;
    "The type constraints placed upon the function’s
     [[type parameters|typeParameters]], if any."
    shared formal TypeConstraint[] typeConstraints;
    
    shared actual formal [Annotations, Type|FunctionModifier|DynamicModifier|VoidModifier, LIdentifier, TypeParameters|Parameters|TypeConstraint|Block|LazySpecifier*] children;
}

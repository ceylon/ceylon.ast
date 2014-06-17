"Abstract interface to perform some operations on AST nodes and possibly get some result.
 
 For every subtype of [[Node]], there is one `transform` method, each returning `Result`.
 These are all `formal`, as there are two sensible default behaviors:
 
 * widening, as done in `WideningTransformer`:
   `transformLIdentifier` delegates to `transformIdentifier`, which in turn
   delegates to `transformNode`, going up their class hierarchy.
 * narrowing, as done in `NarrowingTransformer`:
   `transformIdentifier` switches on [[Identifier]]’s case types and delegates
   to the respective `transform` methods of the subclasses.
 
 Be careful when mixing the two behaviors, lest you end up in an infinite recursion!"
shared abstract class Transformer<out Result>() {
    shared formal Result transformBaseType(BaseType that);
    shared formal Result transformCharacterLiteral(CharacterLiteral that);
    shared formal Result transformCompilationUnit(CompilationUnit that);
    shared formal Result transformExpression(Expression that);
    shared formal Result transformFloatLiteral(FloatLiteral that);
    shared formal Result transformIdentifier(Identifier that);
    shared formal Result transformIntegerLiteral(IntegerLiteral that);
    shared formal Result transformLIdentifier(LIdentifier that);
    shared formal Result transformLiteral(Literal that);
    shared formal Result transformNode(Node that);
    shared formal Result transformOuter(Outer that);
    shared formal Result transformPackage(Package that);
    shared formal Result transformQualifiedType(QualifiedType that);
    shared formal Result transformSelfReference(SelfReference that);
    shared formal Result transformSimpleType(SimpleType that);
    shared formal Result transformStringLiteral(StringLiteral that);
    shared formal Result transformSuper(Super that);
    shared formal Result transformThis(This that);
    shared formal Result transformType(Type that);
    shared formal Result transformTypeNameWithArguments(TypeNameWithArguments that);
    shared formal Result transformUIdentifier(UIdentifier that);
}
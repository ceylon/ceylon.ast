"A [[Transformer]] with the default operation to widen the type of the visited subject:
 [[transformLIdentifier]] delegates to [[transformIdentifier]], which in turn delegates to
 [[transformNode]], which ([[Node]] being without a superclass) is the only `formal` method left."
see (`class Visitor`)
shared abstract class WideningTransformer<out Result>() extends Transformer<Result>() {
    shared actual default Result transformCharacterLiteral(CharacterLiteral that) => transformLiteral(that);
    shared actual default Result transformCompilationUnit(CompilationUnit that) => transformNode(that);
    shared actual default Result transformExpression(Expression that) => transformNode(that);
    shared actual default Result transformFloatLiteral(FloatLiteral that) => transformLiteral(that);
    shared actual default Result transformIdentifier(Identifier that) => transformNode(that);
    shared actual default Result transformIntegerLiteral(IntegerLiteral that) => transformLiteral(that);
    shared actual default Result transformLIdentifier(LIdentifier that) => transformIdentifier(that);
    shared actual default Result transformLiteral(Literal that) => transformNode(that);
    shared actual default Result transformOuter(Outer that) => transformSelfReference(that);
    shared actual default Result transformPackage(Package that) => transformSelfReference(that);
    shared actual default Result transformSelfReference(SelfReference that) => transformExpression(that);
    shared actual default Result transformStringLiteral(StringLiteral that) => transformLiteral(that);
    shared actual default Result transformSuper(Super that) => transformSelfReference(that);
    shared actual default Result transformThis(This that) => transformSelfReference(that);
    shared actual default Result transformType(Type that) => transformNode(that);
    shared actual default Result transformTypeNameWithArguments(TypeNameWithArguments that) => transformType(that);
    shared actual default Result transformUIdentifier(UIdentifier that) => transformIdentifier(that);
}

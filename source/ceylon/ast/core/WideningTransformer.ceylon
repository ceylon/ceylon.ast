"A [[Transformer]] with the default operation to widen the type of the visited subject:
 [[transformLIdentifier]] delegates to [[transformIdentifier]], which in turn delegates to
 [[transformNode]], which ([[Node]] being without a superclass) is the only `formal` method left."
see (`class Visitor`)
shared interface WideningTransformer<out Result> satisfies Transformer<Result> {
    shared actual default Result transformAtom(Atom that) => transformPrimary(that);
    shared actual default Result transformBaseType(BaseType that) => transformSimpleType(that);
    shared actual default Result transformCallableType(CallableType that) => transformPrimaryType(that);
    shared actual default Result transformCharacterLiteral(CharacterLiteral that) => transformLiteral(that);
    shared actual default Result transformCompilationUnit(CompilationUnit that) => transformNode(that);
    shared actual default Result transformDefaultedType(DefaultedType that) => transformTypeIsh(that);
    shared actual default Result transformEntryType(EntryType that) => transformType(that);
    shared actual default Result transformExpression(Expression that) => transformExpressionIsh(that);
    shared actual default Result transformExpressionIsh(ExpressionIsh that) => transformNode(that);
    shared actual default Result transformFloatLiteral(FloatLiteral that) => transformLiteral(that);
    shared actual default Result transformGroupedExpression(GroupedExpression that) => transformAtom(that);
    shared actual default Result transformGroupedType(GroupedType that) => transformPrimaryType(that);
    shared actual default Result transformIdentifier(Identifier that) => transformNode(that);
    shared actual default Result transformIntegerLiteral(IntegerLiteral that) => transformLiteral(that);
    shared actual default Result transformIntersectionType(IntersectionType that) => transformUnionableType(that);
    shared actual default Result transformIterableType(IterableType that) => transformPrimaryType(that);
    shared actual default Result transformLIdentifier(LIdentifier that) => transformIdentifier(that);
    shared actual default Result transformLiteral(Literal that) => transformNode(that);
    shared actual default Result transformMainType(MainType that) => transformType(that);
    shared actual default Result transformNameWithTypeArguments(NameWithTypeArguments that) => transformExpressionIsh(that);
    shared actual default Result transformOptionalType(OptionalType that) => transformPrimaryType(that);
    shared actual default Result transformOuter(Outer that) => transformSelfReference(that);
    shared actual default Result transformPackage(Package that) => transformSelfReference(that);
    shared actual default Result transformPrimary(Primary that) => transformValueExpression(that);
    shared actual default Result transformPrimaryType(PrimaryType that) => transformUnionableType(that);
    shared actual default Result transformQualifiedType(QualifiedType that) => transformSimpleType(that);
    shared actual default Result transformSelfReference(SelfReference that) => transformExpression(that);
    shared actual default Result transformSequentialType(SequentialType that) => transformPrimaryType(that);
    shared actual default Result transformSimpleType(SimpleType that) => transformPrimaryType(that);
    shared actual default Result transformStringLiteral(StringLiteral that) => transformLiteral(that);
    shared actual default Result transformSuper(Super that) => transformSelfReference(that);
    shared actual default Result transformThis(This that) => transformSelfReference(that);
    shared actual default Result transformTupleType(TupleType that) => transformPrimaryType(that);
    shared actual default Result transformType(Type that) => transformTypeIsh(that);
    shared actual default Result transformTypeIsh(TypeIsh that) => transformNode(that);
    shared actual default Result transformTypeList(TypeList that) => transformTypeIsh(that);
    shared actual default Result transformTypeNameWithArguments(TypeNameWithArguments that) => transformTypeIsh(that);
    shared actual default Result transformUIdentifier(UIdentifier that) => transformIdentifier(that);
    shared actual default Result transformUnionType(UnionType that) => transformMainType(that);
    shared actual default Result transformUnionableType(UnionableType that) => transformMainType(that);
    shared actual default Result transformValueExpression(ValueExpression that) => transformExpression(that);
    shared actual default Result transformVariadicType(VariadicType that) => transformTypeIsh(that);
}

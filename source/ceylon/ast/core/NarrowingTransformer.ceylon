"A [[Transformer]] with the default operation to narrow the type of the visited subject:
 [[transformIdentifier]] switches on the subject and descends into the `transform` method
 of the appropriate case type of [[Identifier]]. All “bottom” types’ methods are left `formal`."
see (`class Editor`)
shared interface NarrowingTransformer<out Result> satisfies Transformer<Result> {
    shared actual default Result transformArithmeticOperation(ArithmeticOperation that) {
        switch (that)
        case (is ExponentiationOperation) { return transformExponentiationOperation(that); }
        case (is ProductOperation) { return transformProductOperation(that); }
        case (is QuotientOperation) { return transformQuotientOperation(that); }
        case (is RemainderOperation) { return transformRemainderOperation(that); }
        case (is SumOperation) { return transformSumOperation(that); }
        case (is DifferenceOperation) { return transformDifferenceOperation(that); }
    }
    shared actual default Result transformAtom(Atom that) {
        switch (that)
        case (is Literal) { return transformLiteral(that); }
        case (is SelfReference) { return transformSelfReference(that); }
        case (is GroupedExpression) { return transformGroupedExpression(that); }
    }
    shared actual default Result transformBinaryOperation(BinaryOperation that) {
        switch (that)
        case (is ArithmeticOperation) { return transformArithmeticOperation(that); }
        case (is SetOperation) { return transformSetOperation(that); }
        case (is ScaleOperation) { return transformScaleOperation(that); }
    }
    shared actual default Result transformCompilationUnit(CompilationUnit that) {
        // TODO switch on case types, call appropriate transformSubclass(that)
        throw Error("Not yet implemented!");
    }
    shared actual default Result transformDec(Dec that) {
        switch (that)
        case (is TypeDec) { return transformTypeDec(that); }
    }
    shared actual default Result transformExpression(Expression that) {
        switch (that)
        case (is ValueExpression) { return transformValueExpression(that); }
    }
    shared actual default Result transformExpressionIsh(ExpressionIsh that) {
        switch (that)
        case (is Expression) { return transformExpression(that); }
        case (is TypeIsh) { return transformTypeIsh(that); }
        case (is Identifier) { return transformIdentifier(that); }
    }
    shared actual default Result transformIdentifier(Identifier that) {
        switch (that)
        case (is LIdentifier) { return transformLIdentifier(that); }
        case (is UIdentifier) { return transformUIdentifier(that); }
    }
    shared actual default Result transformLiteral(Literal that) {
        switch (that)
        case (is IntegerLiteral) { return transformIntegerLiteral(that); }
        case (is FloatLiteral) { return transformFloatLiteral(that); }
        case (is StringLiteral) { return transformStringLiteral(that); }
        case (is CharacterLiteral) { return transformCharacterLiteral(that); }
    }
    shared actual default Result transformMainType(MainType that) {
        switch (that)
        case (is UnionableType) { return transformUnionableType(that); }
        case (is UnionType) { return transformUnionType(that); }
    }
    shared actual default Result transformMeta(Meta that) {
        switch (that)
        case (is TypeMeta) { return transformTypeMeta(that); }
        case (is BaseMeta) { return transformBaseMeta(that); }
        case (is MemberMeta) { return transformMemberMeta(that); }
    }
    shared default Result transformMetaQualifier(MetaQualifier that) {
        switch (that)
        case (is SimpleType) { return transformSimpleType(that); }
        case (is GroupedType) { return transformGroupedType(that); }
        case (is MemberName) { return transformLIdentifier(that); }
    }
    shared actual default Result transformNameWithTypeArguments(NameWithTypeArguments that) {
        switch (that)
        case (is MemberNameWithTypeArguments) { return transformMemberNameWithTypeArguments(that); }
        case (is TypeNameWithTypeArguments) { return transformTypeNameWithTypeArguments(that); }
    }
    shared actual default Result transformNode(Node that) {
        switch (that)
        case (is ExpressionIsh) { return transformExpressionIsh(that); }
        case (is CompilationUnit) { return transformCompilationUnit(that); }
    }
    shared actual default Result transformOperation(Operation that) {
        switch (that)
        case (is UnaryOperation) { return transformUnaryOperation(that); }
        case (is BinaryOperation) { return transformBinaryOperation(that); }
    }
    shared actual default Result transformPostfixOperation(PostfixOperation that) {
        switch (that)
        case (is PostfixIncrementOperation) { return transformPostfixIncrementOperation(that); }
        case (is PostfixDecrementOperation) { return transformPostfixDecrementOperation(that); }
    }
    shared default Result transformPrecedence1Expression(Precedence1Expression that) {
        switch (that)
        case (is Primary) { return transformPrimary(that); }
        case (is PrefixOperation) { return transformPrefixOperation(that); }
        case (is PostfixOperation) { return transformPostfixOperation(that); }
    }
    shared default Result transformPrecedence2Expression(Precedence2Expression that) {
        switch (that)
        case (is Precedence1Expression) { return transformPrecedence1Expression(that); }
        case (is ExponentiationOperation) { return transformExponentiationOperation(that); }
    }
    shared default Result transformPrecedence3Expression(Precedence3Expression that) {
        switch (that)
        case (is Precedence2Expression) { return transformPrecedence2Expression(that); }
        case (is UnaryArithmeticOperation) { return transformUnaryArithmeticOperation(that); }
    }
    shared default Result transformPrecedence4Expression(Precedence4Expression that) {
        switch (that)
        case (is Precedence3Expression) { return transformPrecedence3Expression(that); }
        case (is IntersectionOperation) { return transformIntersectionOperation(that); }
    }
    shared default Result transformPrecedence5Expression(Precedence5Expression that) {
        switch (that)
        case (is Precedence4Expression) { return transformPrecedence4Expression(that); }
        case (is UnionOperation) { return transformUnionOperation(that); }
        case (is ComplementOperation) { return transformComplementOperation(that); }
    }
    shared default Result transformPrecedence6Expression(Precedence6Expression that) {
        switch (that)
        case (is Precedence5Expression) { return transformPrecedence5Expression(that); }
        case (is ProductOperation) { return transformProductOperation(that); }
        case (is QuotientOperation) { return transformQuotientOperation(that); }
        case (is RemainderOperation) { return transformRemainderOperation(that); }
    }
    shared default Result transformPrecedence7Expression(Precedence7Expression that) {
        switch (that)
        case (is Precedence6Expression) { return transformPrecedence6Expression(that); }
        case (is ScaleOperation) { return transformScaleOperation(that); }
    }
    shared default Result transformPrecedence8Expression(Precedence8Expression that) {
        switch (that)
        case (is Precedence7Expression) { return transformPrecedence7Expression(that); }
        case (is SumOperation) { return transformSumOperation(that); }
        case (is DifferenceOperation) { return transformDifferenceOperation(that); }
    }
    /* help source-gen find a place for transformPrecedenceYExpression
    shared default Result transformPrecedenceZExpression
     */
    shared actual default Result transformPrefixOperation(PrefixOperation that) {
        switch (that)
        case (is PrefixIncrementOperation) { return transformPrefixIncrementOperation(that); }
        case (is PrefixDecrementOperation) { return transformPrefixDecrementOperation(that); }
    }
    shared actual default Result transformPrimary(Primary that) {
        switch (that)
        case (is Atom) { return transformAtom(that); }
        case (is BaseExpression) { return transformBaseExpression(that); }
        case (is QualifiedExpression) { return transformQualifiedExpression(that); }
        case (is Meta) { return transformMeta(that); }
        case (is Dec) { return transformDec(that); }
    }
    shared actual default Result transformPrimaryType(PrimaryType that) {
        switch (that)
        case (is SimpleType) { return transformSimpleType(that); }
        case (is OptionalType) { return transformOptionalType(that); }
        case (is SequentialType) { return transformSequentialType(that); }
        case (is TupleType) { return transformTupleType(that); }
        case (is IterableType) { return transformIterableType(that); }
        case (is GroupedType) { return transformGroupedType(that); }
        case (is CallableType) { return transformCallableType(that); }
    }
    shared actual default Result transformSelfReference(SelfReference that) {
        switch (that)
        case (is This) { return transformThis(that); }
        case (is Super) { return transformSuper(that); }
        case (is Outer) { return transformOuter(that); }
        case (is Package) { return transformPackage(that); }
    }
    shared actual default Result transformSetOperation(SetOperation that) {
        switch (that)
        case (is IntersectionOperation) { return transformIntersectionOperation(that); }
        case (is UnionOperation) { return transformUnionOperation(that); }
        case (is ComplementOperation) { return transformComplementOperation(that); }
    }
    shared actual default Result transformSimpleType(SimpleType that) {
        switch (that)
        case (is BaseType) { return transformBaseType(that); }
        case (is QualifiedType) { return transformQualifiedType(that); }
    }
    shared actual default Result transformType(Type that) {
        switch (that)
        case (is MainType) { return transformMainType(that); }
        case (is EntryType) { return transformEntryType(that); }
    }
    shared actual default Result transformTypeDec(TypeDec that) {
        switch (that)
        case (is GivenDec) { return transformGivenDec(that); }
    }
    shared actual default Result transformTypeIsh(TypeIsh that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is NameWithTypeArguments) { return transformNameWithTypeArguments(that); }
        case (is VariadicType) { return transformVariadicType(that); }
        case (is DefaultedType) { return transformDefaultedType(that); }
        case (is TypeList) { return transformTypeList(that); }
    }
    shared actual default Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that) {
        switch (that)
        case (is IdentityOperation) { return transformIdentityOperation(that); }
        case (is NegationOperation) { return transformNegationOperation(that); }
    }
    shared actual default Result transformUnaryOperation(UnaryOperation that) {
        switch (that)
        case (is PostfixOperation) { return transformPostfixOperation(that); }
        case (is PrefixOperation) { return transformPrefixOperation(that); }
        case (is UnaryArithmeticOperation) { return transformUnaryArithmeticOperation(that); }
    }
    shared actual default Result transformUnionableType(UnionableType that) {
        switch (that)
        case (is PrimaryType) { return transformPrimaryType(that); }
        case (is IntersectionType) { return transformIntersectionType(that); }
    }
    shared actual default Result transformValueExpression(ValueExpression that) {
        switch (that)
        case (is Primary) { return transformPrimary(that); }
        case (is Operation) { return transformOperation(that); }
    }
}

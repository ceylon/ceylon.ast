"An AST editor.
 There is one method per AST node; override the methods for which you need to change the AST,
 and leave the others untouched.
 
 The default operation for “bottom“ node types’ methods is to copy the node, editing the children.
 (The default operation for non-“bottom” node types’ methods is inherited from [[NarrowingTransformer]],
 see there.)
 By itself, an [[Editor]] will not actually edit the AST –
 it’s only scaffolding that allows you to easily edit parts of the AST without having to bother with
 the deep nesting of the nodes.
 
 For example:
 ~~~
 class PrefixEditor(String prefix) extends Editor() {
     shared actual Identifier editIdentifier(Identifier that)
             => that.copy { name = prefix + that.name; };
 }
 ~~~
 will prepend `prefix` to every [[Identifier]] in the AST.
 
 Note that this deep copy of the AST can be expensive; if you know that you will not touch
 certain parts of the AST – for example, you only edit method names, and never instructions –
 you might want to override some methods to `return this` instead of a deep copy
 (in this example, override [[transformBody]])."
shared /* abstract */ class Editor() satisfies NarrowingTransformer<Node> { // TODO make interface
    shared actual default AndOperation transformAndOperation(AndOperation that)
            => that.copy();
    shared actual default ArithmeticOperation transformArithmeticOperation(ArithmeticOperation that) {
        assert (is ArithmeticOperation ret = super.transformArithmeticOperation(that));
        return ret;
    }
    
    shared actual default AssignOperation transformAssignOperation(AssignOperation that)
            => that.copy();
    shared actual default AssignmentOperation transformAssignmentOperation(AssignmentOperation that) {
        assert (is AssignmentOperation ret = super.transformAssignmentOperation(that));
        return ret;
    }
    shared actual default Atom transformAtom(Atom that) {
        assert (is Atom ret = super.transformAtom(that));
        return ret;
    }
    shared actual default BaseExpression transformBaseExpression(BaseExpression that)
            => that.copy();
    shared actual default BaseMeta transformBaseMeta(BaseMeta that)
            => that.copy();
    shared actual default BaseType transformBaseType(BaseType that)
            => that.copy(transformTypeNameWithTypeArguments(that.nameAndArgs));
    shared actual default BinaryOperation transformBinaryOperation(BinaryOperation that) {
        assert (is BinaryOperation ret = super.transformBinaryOperation(that));
        return ret;
    }
    shared actual default CallableType transformCallableType(CallableType that)
            => that.copy(transformPrimaryType(that.returnType), transformTypeList(that.argumentTypes));
    shared actual default CharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => that.copy();
    shared actual default CompareOperation transformCompareOperation(CompareOperation that)
            => that.copy();
    shared actual default ComparisonOperation transformComparisonOperation(ComparisonOperation that) {
        assert (is ComparisonOperation ret = super.transformComparisonOperation(that));
        return ret;
    }
    shared actual default CompilationUnit transformCompilationUnit(CompilationUnit that) {
        assert (is CompilationUnit ret = super.transformCompilationUnit(that));
        return ret;
    }
    shared actual default ComplementOperation transformComplementOperation(ComplementOperation that)
            => that.copy();
    shared actual default Dec transformDec(Dec that) {
        assert (is Dec ret = super.transformDec(that));
        return ret;
    }
    shared actual default DefaultedType transformDefaultedType(DefaultedType that)
            => that.copy(transformType(that.type));
    shared actual default DifferenceOperation transformDifferenceOperation(DifferenceOperation that)
            => that.copy();
    shared actual default ElseOperation transformElseOperation(ElseOperation that)
            => that.copy();
    shared actual default EntryOperation transformEntryOperation(EntryOperation that)
            => that.copy();
    shared actual default EqualOperation transformEqualOperation(EqualOperation that)
            => that.copy();
    shared actual default EqualityOperation transformEqualityOperation(EqualityOperation that) {
        assert (is EqualityOperation ret = super.transformEqualityOperation(that));
        return ret;
    }
    shared actual default ExistsOperation transformExistsOperation(ExistsOperation that)
            => that.copy();
    shared actual default IdenticalOperation transformIdenticalOperation(IdenticalOperation that)
            => that.copy();
    shared actual default InOperation transformInOperation(InOperation that)
            => that.copy();
    shared actual default IsOperation transformIsOperation(IsOperation that)
            => that.copy();
    shared actual default LargeAsOperation transformLargeAsOperation(LargeAsOperation that)
            => that.copy();
    shared actual default LargerOperation transformLargerOperation(LargerOperation that)
            => that.copy();
    shared actual default LogicalOperation transformLogicalOperation(LogicalOperation that) {
        assert (is LogicalOperation ret = super.transformLogicalOperation(that));
        return ret;
    }
    shared actual default MeasureOperation transformMeasureOperation(MeasureOperation that)
            => that.copy();
    shared actual default NonemptyOperation transformNonemptyOperation(NonemptyOperation that)
            => that.copy();
    shared actual default NotEqualOperation transformNotEqualOperation(NotEqualOperation that)
            => that.copy();
    shared actual default NotOperation transformNotOperation(NotOperation that)
            => that.copy();
    shared actual default OfOperation transformOfOperation(OfOperation that)
            => that.copy();
    shared actual default OrOperation transformOrOperation(OrOperation that)
            => that.copy();
    shared actual default Precedence10Expression transformPrecedence10Expression(Precedence10Expression that) {
        assert (is Precedence10Expression ret = super.transformPrecedence10Expression(that));
        return ret;
    }
    shared actual default Precedence11Expression transformPrecedence11Expression(Precedence11Expression that) {
        assert (is Precedence11Expression ret = super.transformPrecedence11Expression(that));
        return ret;
    }
    shared actual default Precedence12Expression transformPrecedence12Expression(Precedence12Expression that) {
        assert (is Precedence12Expression ret = super.transformPrecedence12Expression(that));
        return ret;
    }
    shared actual default Precedence13Expression transformPrecedence13Expression(Precedence13Expression that) {
        assert (is Precedence13Expression ret = super.transformPrecedence13Expression(that));
        return ret;
    }
    shared actual default Precedence14Expression transformPrecedence14Expression(Precedence14Expression that) {
        assert (is Precedence14Expression ret = super.transformPrecedence14Expression(that));
        return ret;
    }
    shared actual default Precedence15Expression transformPrecedence15Expression(Precedence15Expression that) {
        assert (is Precedence15Expression ret = super.transformPrecedence15Expression(that));
        return ret;
    }
    shared actual default Precedence16Expression transformPrecedence16Expression(Precedence16Expression that) {
        assert (is Precedence16Expression ret = super.transformPrecedence16Expression(that));
        return ret;
    }
    shared actual default Precedence17Expression transformPrecedence17Expression(Precedence17Expression that) {
        assert (is Precedence17Expression ret = super.transformPrecedence17Expression(that));
        return ret;
    }
    shared actual default Precedence7Expression transformPrecedence7Expression(Precedence7Expression that) {
        assert (is Precedence7Expression ret = super.transformPrecedence7Expression(that));
        return ret;
    }
    shared actual default Precedence8Expression transformPrecedence8Expression(Precedence8Expression that) {
        assert (is Precedence8Expression ret = super.transformPrecedence8Expression(that));
        return ret;
    }
    shared actual default Precedence9Expression transformPrecedence9Expression(Precedence9Expression that) {
        assert (is Precedence9Expression ret = super.transformPrecedence9Expression(that));
        return ret;
    }
    shared actual default QuotientOperation transformQuotientOperation(QuotientOperation that)
            => that.copy();
    shared actual default EntryType transformEntryType(EntryType that)
            => that.copy(transformMainType(that.key), transformMainType(that.item));
    shared actual default ExponentiationOperation transformExponentiationOperation(ExponentiationOperation that)
            => that.copy();
    shared actual default ExpressionIsh transformExpressionIsh(ExpressionIsh that) {
        assert (is ExpressionIsh ret = super.transformExpressionIsh(that));
        return ret;
    }
    shared actual default FloatLiteral transformFloatLiteral(FloatLiteral that)
            => that.copy();
    shared actual default GivenDec transformGivenDec(GivenDec that)
            => that.copy();
    shared actual default GroupedExpression transformGroupedExpression(GroupedExpression that)
            => that.copy();
    shared actual default GroupedType transformGroupedType(GroupedType that)
            => that.copy(transformType(that.type));
    shared actual default Identifier transformIdentifier(Identifier that)
            => that.copy();
    shared actual default IdentityOperation transformIdentityOperation(IdentityOperation that)
            => that.copy();
    shared actual default IntersectionOperation transformIntersectionOperation(IntersectionOperation that)
            => that.copy();
    shared actual default IterableType transformIterableType(IterableType that) {
        if (exists variadicType = that.variadicType) {
            return that.copy(transformVariadicType(variadicType));
        } else {
            return that.copy(null);
        }
    }
    shared actual default IntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => that.copy();
    shared actual default IntersectionType transformIntersectionType(IntersectionType that)
            => that.copy();
    shared actual default LIdentifier transformLIdentifier(LIdentifier that)
            => that.copy();
    shared actual default Literal transformLiteral(Literal that) {
        assert (is Literal ret = super.transformLiteral(that));
        return ret;
    }
    shared actual default MainType transformMainType(MainType that) {
        assert (is MainType ret = super.transformMainType(that));
        return ret;
    }
    shared actual default MemberMeta transformMemberMeta(MemberMeta that)
            => that.copy();
    shared actual default MemberNameWithTypeArguments transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that)
            => that.copy();
    shared actual default Meta transformMeta(Meta that) {
        assert (is Meta ret = super.transformMeta(that));
        return ret;
    }
    shared actual default MetaQualifier transformMetaQualifier(MetaQualifier that) {
        assert (is MetaQualifier ret = super.transformMetaQualifier(that));
        return ret;
    }
    shared actual default ProductOperation transformProductOperation(ProductOperation that)
            => that.copy();
    shared actual default NameWithTypeArguments transformNameWithTypeArguments(NameWithTypeArguments that) {
        assert (is NameWithTypeArguments ret = super.transformNameWithTypeArguments(that));
        return ret;
    }
    shared actual default NegationOperation transformNegationOperation(NegationOperation that)
            => that.copy();
    shared actual default Operation transformOperation(Operation that) {
        assert (is Operation ret = super.transformOperation(that));
        return ret;
    }
    shared actual default OptionalType transformOptionalType(OptionalType that)
            => that.copy(transformPrimaryType(that.definiteType));
    shared actual default Outer transformOuter(Outer that)
            => that.copy();
    shared actual default Package transformPackage(Package that)
            => that.copy();
    shared actual default PostfixDecrementOperation transformPostfixDecrementOperation(PostfixDecrementOperation that)
            => that.copy();
    shared actual default PostfixIncrementOperation transformPostfixIncrementOperation(PostfixIncrementOperation that)
            => that.copy();
    shared actual default PostfixOperation transformPostfixOperation(PostfixOperation that) {
        assert (is PostfixOperation ret = super.transformPostfixOperation(that));
        return ret;
    }
    shared actual default Precedence1Expression transformPrecedence1Expression(Precedence1Expression that) {
        assert (is Precedence1Expression ret = super.transformPrecedence1Expression(that));
        return ret;
    }
    shared actual default Precedence2Expression transformPrecedence2Expression(Precedence2Expression that) {
        assert (is Precedence2Expression ret = super.transformPrecedence2Expression(that));
        return ret;
    }
    shared actual default Precedence3Expression transformPrecedence3Expression(Precedence3Expression that) {
        assert (is Precedence3Expression ret = super.transformPrecedence3Expression(that));
        return ret;
    }
    shared actual default Precedence4Expression transformPrecedence4Expression(Precedence4Expression that) {
        assert (is Precedence4Expression ret = super.transformPrecedence4Expression(that));
        return ret;
    }
    shared actual default Precedence5Expression transformPrecedence5Expression(Precedence5Expression that) {
        assert (is Precedence5Expression ret = super.transformPrecedence5Expression(that));
        return ret;
    }
    shared actual default Precedence6Expression transformPrecedence6Expression(Precedence6Expression that) {
        assert (is Precedence6Expression ret = super.transformPrecedence6Expression(that));
        return ret;
    }
    shared actual default PrefixDecrementOperation transformPrefixDecrementOperation(PrefixDecrementOperation that)
            => that.copy();
    shared actual default PrefixIncrementOperation transformPrefixIncrementOperation(PrefixIncrementOperation that)
            => that.copy();
    shared actual default PrefixOperation transformPrefixOperation(PrefixOperation that) {
        assert (is PrefixOperation ret = super.transformPrefixOperation(that));
        return ret;
    }
    shared actual default Primary transformPrimary(Primary that) {
        assert (is Primary ret = super.transformPrimary(that));
        return ret;
    }
    shared actual default PrimaryType transformPrimaryType(PrimaryType that) {
        assert (is PrimaryType ret = super.transformPrimaryType(that));
        return ret;
    }
    shared actual default QualifiedExpression transformQualifiedExpression(QualifiedExpression that)
            => that.copy();
    shared actual default QualifiedType transformQualifiedType(QualifiedType that) {
        value qualifyingType = that.qualifyingType;
        switch (qualifyingType)
        case (is SimpleType) { return that.copy(transformSimpleType(qualifyingType)); }
        case (is GroupedType) { return that.copy(transformGroupedType(qualifyingType)); }
    }
    shared actual default RemainderOperation transformRemainderOperation(RemainderOperation that)
            => that.copy();
    shared actual default ScaleOperation transformScaleOperation(ScaleOperation that)
            => that.copy();
    shared actual default SelfReference transformSelfReference(SelfReference that) {
        assert (is SelfReference ret = super.transformSelfReference(that));
        return ret;
    }
    shared actual default SequentialType transformSequentialType(SequentialType that)
            => that.copy(transformPrimaryType(that.elementType));
    shared actual default SetOperation transformSetOperation(SetOperation that) {
        assert (is SetOperation ret = super.transformSetOperation(that));
        return ret;
    }
    shared actual default SimpleType transformSimpleType(SimpleType that) {
        assert (is SimpleType ret = super.transformSimpleType(that));
        return ret;
    }
    shared actual default SmallAsOperation transformSmallAsOperation(SmallAsOperation that)
            => that.copy();
    shared actual default SmallerOperation transformSmallerOperation(SmallerOperation that)
            => that.copy();
    shared actual default SpanOperation transformSpanOperation(SpanOperation that)
            => that.copy();
    shared actual default StringLiteral transformStringLiteral(StringLiteral that)
            => that.copy();
    shared actual default SumOperation transformSumOperation(SumOperation that)
            => that.copy();
    shared actual default Super transformSuper(Super that)
            => that.copy();
    shared actual default ThenOperation transformThenOperation(ThenOperation that)
            => that.copy();
    shared actual default This transformThis(This that)
            => that.copy();
    shared actual default TupleType transformTupleType(TupleType that)
            => that.copy(transformTypeList(that.typeList));
    shared actual default Type transformType(Type that) {
        assert (is Type ret = super.transformType(that));
        return ret;
    }
    shared actual default TypeDec transformTypeDec(TypeDec that) {
        assert (is TypeDec ret = super.transformTypeDec(that));
        return ret;
    }
    shared actual default TypeIsh transformTypeIsh(TypeIsh that) {
        assert (is TypeIsh ret = super.transformTypeIsh(that));
        return ret;
    }
    shared actual default TypeList transformTypeList(TypeList that) {
        Type|DefaultedType transformTypeOrDefaultedType(Type|DefaultedType that) {
            switch (that)
            case (is Type) { return transformType(that); }
            case (is DefaultedType) { return transformDefaultedType(that); }
        }
        if (exists var = that.variadic) {
            return that.copy(that.elements.collect(transformTypeOrDefaultedType), transformVariadicType(var));
        } else {
            return that.copy(that.elements.collect(transformTypeOrDefaultedType));
        }
    }
    shared actual default TypeMeta transformTypeMeta(TypeMeta that)
            => that.copy();
    shared actual default TypeNameWithTypeArguments transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) {
        if (exists args = that.typeArguments) {
            return that.copy(transformUIdentifier(that.name), args.collect(transformType));
        } else {
            return that.copy(transformUIdentifier(that.name), null);
        }
    }
    shared actual default UIdentifier transformUIdentifier(UIdentifier that)
            => that.copy();
    shared actual default UnaryArithmeticOperation transformUnaryArithmeticOperation(UnaryArithmeticOperation that) {
        assert (is UnaryArithmeticOperation ret = super.transformUnaryArithmeticOperation(that));
        return ret;
    }
    
    shared actual default UnaryIshOperation transformUnaryIshOperation(UnaryIshOperation that) {
        assert (is UnaryIshOperation ret = super.transformUnaryIshOperation(that));
        return ret;
    }
    shared actual default UnaryOperation transformUnaryOperation(UnaryOperation that) {
        assert (is UnaryOperation ret = super.transformUnaryOperation(that));
        return ret;
    }
    shared actual default UnaryTypeOperation transformUnaryTypeOperation(UnaryTypeOperation that) {
        assert (is UnaryTypeOperation ret = super.transformUnaryTypeOperation(that));
        return ret;
    }
    shared actual default UnionOperation transformUnionOperation(UnionOperation that)
            => that.copy();
    shared actual default UnionableType transformUnionableType(UnionableType that) {
        assert (is UnionableType ret = super.transformUnionableType(that));
        return ret;
    }
    shared actual default UnionType transformUnionType(UnionType that)
            => that.copy();
    shared actual default ValueExpression transformValueExpression(ValueExpression that) {
        assert (is ValueExpression ret = super.transformValueExpression(that));
        return ret;
    }
    shared actual default VariadicType transformVariadicType(VariadicType that)
            => that.copy(transformMainType(that.elementType));
}

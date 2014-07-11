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
    shared actual default CallableType transformCallableType(CallableType that)
            => that.copy(transformPrimaryType(that.returnType), transformTypeList(that.argumentTypes));
    shared actual default CharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => that.copy();
    shared actual default CompilationUnit transformCompilationUnit(CompilationUnit that) {
        assert (is CompilationUnit ret = super.transformCompilationUnit(that));
        return ret;
    }
    shared actual default Dec transformDec(Dec that) {
        assert (is Dec ret = super.transformDec(that));
        return ret;
    }
    shared actual default DefaultedType transformDefaultedType(DefaultedType that)
            => that.copy(transformType(that.type));
    shared actual default EntryType transformEntryType(EntryType that)
            => that.copy(transformMainType(that.key), transformMainType(that.item));
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
    shared actual default NameWithTypeArguments transformNameWithTypeArguments(NameWithTypeArguments that) {
        assert (is NameWithTypeArguments ret = super.transformNameWithTypeArguments(that));
        return ret;
    }
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
    shared actual default SelfReference transformSelfReference(SelfReference that) {
        assert (is SelfReference ret = super.transformSelfReference(that));
        return ret;
    }
    shared actual default SequentialType transformSequentialType(SequentialType that)
            => that.copy(transformPrimaryType(that.elementType));
    shared actual default SimpleType transformSimpleType(SimpleType that) {
        assert (is SimpleType ret = super.transformSimpleType(that));
        return ret;
    }
    shared actual default StringLiteral transformStringLiteral(StringLiteral that)
            => that.copy();
    shared actual default Super transformSuper(Super that)
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
    shared actual default UnaryOperation transformUnaryOperation(UnaryOperation that) {
        assert (is UnaryOperation ret = super.transformUnaryOperation(that));
        return ret;
    }
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

"An AST visitor.
 There is one method per AST node; override the methods for which you need to do something,
 and leave the others untouched.
 
 The default operation for most node types is to pass the visit up to the node’s supertype;
 for example, if you override only [[visitIdentifier]], you will receive calls to
 both [[LIdentifier.visit]] and [[UIdentifier.visit]], as the default operation for
 [[visitLIdentifier]] and [[visitUIdentifier]] is to delegate to [[visitIdentifier]].
 [[visitNode]] is different: As the root of the AST class hierarchy, it has no superclass;
 instead, it [[visits all the children|Node.visitChildren]] of the node.
 Thus, the default visitor will already traverse the AST fully,
 and if you need to perform some operation only for some node type that might appear
 anywhere in the AST, you can simply override that particular method and leave the rest as it is."
shared /* abstract */ class Visitor() satisfies WideningTransformer<Anything> { // TODO make interface
    transformAtom(Atom that) => visitAtom(that);
    transformBaseExpression(BaseExpression that) => visitBaseExpression(that);
    transformBaseMeta(BaseMeta that) => visitBaseMeta(that);
    transformBaseType(BaseType that) => visitBaseType(that);
    transformCallableType(CallableType that) => visitCallableType(that);
    transformCharacterLiteral(CharacterLiteral that) => visitCharacterLiteral(that);
    transformCompilationUnit(CompilationUnit that) => visitCompilationUnit(that);
    transformDefaultedType(DefaultedType that) => visitDefaultedType(that);
    transformEntryType(EntryType that) => visitEntryType(that);
    transformExpression(Expression that) => visitExpression(that);
    transformExpressionIsh(ExpressionIsh that) => visitExpressionIsh(that);
    transformFloatLiteral(FloatLiteral that) => visitFloatLiteral(that);
    transformGroupedExpression(GroupedExpression that) => visitGroupedExpression(that);
    transformGroupedType(GroupedType that) => visitGroupedType(that);
    transformIdentifier(Identifier that) => visitIdentifier(that);
    transformIntegerLiteral(IntegerLiteral that) => visitIntegerLiteral(that);
    transformIntersectionType(IntersectionType that) => visitIntersectionType(that);
    transformIterableType(IterableType that) => visitIterableType(that);
    transformLIdentifier(LIdentifier that) => visitLIdentifier(that);
    transformLiteral(Literal that) => visitLiteral(that);
    transformMainType(MainType that) => visitMainType(that);
    transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => visitMemberNameWithTypeArguments(that);
    transformMeta(Meta that) => visitMeta(that);
    transformNameWithTypeArguments(NameWithTypeArguments that) => visitNameWithTypeArguments(that);
    transformNode(Node that) => visitNode(that);
    transformOptionalType(OptionalType that) => visitOptionalType(that);
    transformOuter(Outer that) => visitOuter(that);
    transformPackage(Package that) => visitPackage(that);
    transformPrimary(Primary that) => visitPrimary(that);
    transformQualifiedExpression(QualifiedExpression that) => visitQualifiedExpression(that);
    transformQualifiedType(QualifiedType that) => visitQualifiedType(that);
    transformSelfReference(SelfReference that) => visitSelfReference(that);
    transformSequentialType(SequentialType that) => visitSequentialType(that);
    transformSimpleType(SimpleType that) => visitSimpleType(that);
    transformStringLiteral(StringLiteral that) => visitStringLiteral(that);
    transformSuper(Super that) => visitSuper(that);
    transformThis(This that) => visitThis(that);
    transformTupleType(TupleType that) => visitTupleType(that);
    transformType(Type that) => visitType(that);
    transformTypeList(TypeList that) => visitTypeList(that);
    transformTypeMeta(TypeMeta that) => visitTypeMeta(that);
    transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => visitTypeNameWithTypeArguments(that);
    transformUIdentifier(UIdentifier that) => visitUIdentifier(that);
    transformUnionType(UnionType that) => visitUnionType(that);
    transformUnionableType(UnionableType that) => visitUnionableType(that);
    
    shared default void visitAtom(Atom that) => super.transformAtom(that);
    shared default void visitBaseExpression(BaseExpression that) => super.transformBaseExpression(that);
    shared default void visitBaseMeta(BaseMeta that) => super.transformBaseMeta(that);
    shared default void visitBaseType(BaseType that) => super.transformBaseType(that);
    shared default void visitCallableType(CallableType that) => super.transformCallableType(that);
    shared default void visitCharacterLiteral(CharacterLiteral that) => super.transformCharacterLiteral(that);
    shared default void visitCompilationUnit(CompilationUnit that) => super.transformCompilationUnit(that);
    shared default void visitDefaultedType(DefaultedType that) => super.transformDefaultedType(that);
    shared default void visitEntryType(EntryType that) => super.transformEntryType(that);
    shared default void visitExpression(Expression that) => super.transformExpression(that);
    shared default void visitExpressionIsh(ExpressionIsh that) => super.transformExpressionIsh(that);
    shared default void visitFloatLiteral(FloatLiteral that) => super.transformFloatLiteral(that);
    shared default void visitGroupedExpression(GroupedExpression that) => super.transformGroupedExpression(that);
    shared default void visitGroupedType(GroupedType that) => super.transformGroupedType(that);
    shared default void visitIdentifier(Identifier that) => super.transformIdentifier(that);
    shared default void visitIntegerLiteral(IntegerLiteral that) => super.transformIntegerLiteral(that);
    shared default void visitIntersectionType(IntersectionType that) => super.transformIntersectionType(that);
    shared default void visitIterableType(IterableType that) => super.transformIterableType(that);
    shared default void visitLIdentifier(LIdentifier that) => super.transformLIdentifier(that);
    shared default void visitLiteral(Literal that) => super.transformLiteral(that);
    shared default void visitMainType(MainType that) => super.transformMainType(that);
    shared default void visitMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => super.transformMemberNameWithTypeArguments(that);
    shared default void visitMeta(Meta that) => super.transformMeta(that);
    shared default void visitNameWithTypeArguments(NameWithTypeArguments that) => super.transformNameWithTypeArguments(that);
    shared default void visitNode(Node that) => that.visitChildren(this);
    shared default void visitOptionalType(OptionalType that) => super.transformOptionalType(that);
    shared default void visitOuter(Outer that) => super.transformOuter(that);
    shared default void visitPackage(Package that) => super.transformPackage(that);
    shared default void visitPrimary(Primary that) => super.transformPrimary(that);
    shared default void visitQualifiedExpression(QualifiedExpression that) => super.transformQualifiedExpression(that);
    shared default void visitQualifiedType(QualifiedType that) => super.transformQualifiedType(that);
    shared default void visitSelfReference(SelfReference that) => super.transformSelfReference(that);
    shared default void visitSequentialType(SequentialType that) => super.transformSequentialType(that);
    shared default void visitSimpleType(SimpleType that) => super.transformSimpleType(that);
    shared default void visitStringLiteral(StringLiteral that) => super.transformStringLiteral(that);
    shared default void visitSuper(Super that) => super.transformSuper(that);
    shared default void visitThis(This that) => super.transformThis(that);
    shared default void visitTupleType(TupleType that) => super.transformTupleType(that);
    shared default void visitType(Type that) => super.transformType(that);
    shared default void visitTypeList(TypeList that) => super.transformTypeList(that);
    shared default void visitTypeMeta(TypeMeta that) => super.transformTypeMeta(that);
    shared default void visitTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => super.transformTypeNameWithTypeArguments(that);
    shared default void visitUIdentifier(UIdentifier that) => super.transformUIdentifier(that);
    shared default void visitUnionType(UnionType that) => super.transformUnionType(that);
    shared default void visitUnionableType(UnionableType that) => super.transformUnionableType(that);
}

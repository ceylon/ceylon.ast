"A [[Transformer]] with the default operation to narrow the type of the visited subject:
 [[transformIdentifier]] switches on the subject and descends into the `transform` method
 of the appropriate case type of [[Identifier]]. All “bottom” types’ methods are left `formal`."
see (`class Editor`)
shared interface NarrowingTransformer<out Result> satisfies Transformer<Result> {
    shared actual default Result transformCompilationUnit(CompilationUnit that) {
        // TODO switch on case types, call appropriate transformSubclass(that)
        throw Error("Not yet implemented!");
    }
    shared actual default Result transformExpression(Expression that) {
        switch (that)
        case (is Literal) { return transformLiteral(that); }
        case (is SelfReference) { return transformSelfReference(that); }
        else { throw Error("Not yet implemented!"); }
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
    shared actual default Result transformNode(Node that) {
        // TODO switch on case types, call appropriate transformSubclass(that)
        throw Error("Not yet implemented!");
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
    shared actual default Result transformTypeIsh(TypeIsh that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is TypeNameWithArguments) { return transformTypeNameWithArguments(that); }
        case (is VariadicType) { return transformVariadicType(that); }
        case (is DefaultedType) { return transformDefaultedType(that); }
        case (is TypeList) { return transformTypeList(that); }
    }
    shared actual default Result transformUnionableType(UnionableType that) {
        switch (that)
        case (is PrimaryType) { return transformPrimaryType(that); }
        case (is IntersectionType) { return transformIntersectionType(that); }
    }
}

import ceylon.collection {
    StringBuilder
}

"Builds a Ceylon expression string for an AST node;
 compiling and evaluating the resulting string will yield
 a copy of the transformed node.
 
 Usage:
 ~~~
 myNode.transform(CeylonExpressionTransformer());
 ~~~"
shared class CeylonExpressionTransformer(String indentLevel = "    ") satisfies NarrowingTransformer<String> {
    
    variable String indent = "";
    
    String transformWithIndent(Node|Node[]|Null that) {
        switch (that)
        case (is Node) {
            value origIndent = indent;
            indent += indentLevel;
            value ret = that.transform(this);
            indent = origIndent;
            return ret;
        }
        case (is []) {
            return "[]";
        }
        case (null) {
            return "null";
        }
        else { // case (is [Node+]) { – but Node and [Node+] are not disjoint, because Sequence is a sealed interface, not a class
            assert (is [Node+] that);
            value origIndent = indent;
            indent += indentLevel + indentLevel;
            StringBuilder code = StringBuilder();
            code.append("[");
            if (that.size > 1) {
                code.appendNewline();
                code.append(indent);
            }
            code.append(that.first.transform(this));
            for (node in that.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(node.transform(this));
            }
            if (that.size > 1) {
                code.appendNewline();
                code.append(origIndent + indentLevel);
            }
            code.append("]");
            indent = origIndent;
            return code.string;
        }
    }
    
    transformAddAssignmentOperation(AddAssignmentOperation that)
            => "AddAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformAndAssignmentOperation(AndAssignmentOperation that)
            => "AndAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformAndOperation(AndOperation that)
            => "AndOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformArgumentList(ArgumentList that)
            => that.sequenceArgument exists
            then "ArgumentList {
                  `` indent + indentLevel ``listedArguments = ``transformWithIndent(that.listedArguments)``;
                  `` indent + indentLevel ``sequenceArgument = ``transformWithIndent(that.sequenceArgument)``;
                  ``indent``}"
            else "ArgumentList(``transformWithIndent(that.listedArguments)``)";
    transformAnnotation(Annotation that)
            => "Annotation {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``arguments = ``transformWithIndent(that.arguments)``;
                ``indent``}";
    transformAnnotations(Annotations that)
            => that.anonymousAnnotation exists
            then (that.annotations nonempty
                then "Annotations {
                      `` indent + indentLevel ``anonymousAnnotation = ``transformWithIndent(that.anonymousAnnotation)``;
                      `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                      ``indent``}"
                else "Annotations(``transformWithIndent(that.anonymousAnnotation)``)")
            else (that.annotations nonempty
                then "Annotations {
                      `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                      ``indent``}"
                else "Annotations()");
    transformAnonymousArgument(AnonymousArgument that) => "AnonymousArgument(``transformWithIndent(that.expression)``)";
    transformAssignOperation(AssignOperation that)
            => "AssignOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``expression = ``transformWithIndent(that.expression)``;
                ``indent``}";
    transformBaseExpression(BaseExpression that) => "BaseExpression(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseMeta(BaseMeta that) => "BaseMeta(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseType(BaseType that) => "BaseType(``transformWithIndent(that.nameAndArgs)``)";
    transformBlock(Block that) => "Block(``transformWithIndent(that.content)``)";
    transformCallableParameter(CallableParameter that)
            => "CallableParameter {
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                ``indent``}";
    transformCallableType(CallableType that)
            => "CallableType {
                `` indent + indentLevel ``returnType = ``transformWithIndent(that.returnType)``;
                `` indent + indentLevel ``argumentTypes = ``transformWithIndent(that.argumentTypes)``;
                ``indent``}";
    transformCharacterLiteral(CharacterLiteral that) => "CharacterLiteral(\"\"\"``that.text``\"\"\")";
    transformClassBody(ClassBody that) => "ClassBody(``transformWithIndent(that.content)``)";
    transformClosedBound(ClosedBound that) => "ClosedBound(``transformWithIndent(that.endpoint)``)";
    transformCompareOperation(CompareOperation that)
            => "CompareOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformCompilationUnit(CompilationUnit that) => "CompilationUnit()";
    transformComplementAssignmentOperation(ComplementAssignmentOperation that)
            => "ComplementAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformComplementOperation(ComplementOperation that)
            => "ComplementOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformDefaultedCallableParameter(DefaultedCallableParameter that)
            => "DefaultedCallableParameter {
                `` indent + indentLevel ``parameter = ``transformWithIndent(that.parameter)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformDefaultedParameterReference(DefaultedParameterReference that)
            => "DefaultedParameterReference {
                `` indent + indentLevel ``parameter = ``transformWithIndent(that.parameter)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformDefaultedType(DefaultedType that) => "DefaultedType(``transformWithIndent(that.type)``)";
    transformDefaultedValueParameter(DefaultedValueParameter that)
            => "DefaultedValueParameter {
                `` indent + indentLevel ``parameter = ``transformWithIndent(that.parameter)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformDifferenceOperation(DifferenceOperation that)
            => "DifferenceOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformDivideAssignmentOperation(DivideAssignmentOperation that)
            => "DivideAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformDynamicModifier(DynamicModifier that) => "DynamicModifier()";
    transformDynamicValue(DynamicValue that) => "DynamicValue(``transformWithIndent(that.content)``)";
    transformElseOperation(ElseOperation that)
            => "ElseOperation {
                `` indent + indentLevel ``optionalValue = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``defaultValue = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformEntryOperation(EntryOperation that)
            => "EntryOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformEntryType(EntryType that)
            => "EntryType {
                `` indent + indentLevel ``key = ``transformWithIndent(that.key)``;
                `` indent + indentLevel ``item = ``transformWithIndent(that.item)``;
                ``indent``}";
    transformEqualOperation(EqualOperation that)
            => "EqualOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformExistsOperation(ExistsOperation that) => "ExistsOperation(``transformWithIndent(that.operand)``)";
    transformExponentiationOperation(ExponentiationOperation that)
            => "ExponentiationOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformFloatLiteral(FloatLiteral that) => "FloatLiteral(\"``that.text``\")";
    transformFullPackageName(FullPackageName that) => "FullPackageName(``transformWithIndent(that.components)``)";
    transformGivenDec(GivenDec that) => "GivenDec(``transformWithIndent(that.typeParameter)``)";
    transformGroupedExpression(GroupedExpression that) => "GroupedExpression(``transformWithIndent(that.innerExpression)``)";
    transformGroupedType(GroupedType that) => "GroupedType(``transformWithIndent(that.type)``)";
    transformIdenticalOperation(IdenticalOperation that)
            => "IdenticalOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformIdentityOperation(IdentityOperation that) => "IdentityOperation(``transformWithIndent(that.operand)``)";
    transformInModifier(InModifier that) => "InModifier()";
    transformInOperation(InOperation that)
            => "InOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformIntegerLiteral(IntegerLiteral that) => "IntegerLiteral(\"``that.text``\")";
    transformInterfaceBody(InterfaceBody that) => "InterfaceBody(``transformWithIndent(that.content)``)";
    transformIntersectionType(IntersectionType that) => "IntersectionType(``transformWithIndent(that.children)``)";
    transformIntersectAssignmentOperation(IntersectAssignmentOperation that)
            => "IntersectAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformIntersectionOperation(IntersectionOperation that)
            => "IntersectionOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformInvocation(Invocation that)
            => "Invocation {
                `` indent + indentLevel ``invoked = ``transformWithIndent(that.invoked)``;
                `` indent + indentLevel ``arguments = ``transformWithIndent(that.arguments)``;
                ``indent``}";
    transformIsOperation(IsOperation that)
            => "IsOperation {
                `` indent + indentLevel ``child = ``transformWithIndent(that.operand)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                ``indent``}";
    transformIterable(Iterable that) => "Iterable(``transformWithIndent(that.argumentList)``)";
    transformIterableType(IterableType that) => "IterableType(``transformWithIndent(that.variadicType)``)";
    transformLIdentifier(LIdentifier that) => "LIdentifier(\"``that.name``\", ``that.enforcePrefix``)";
    transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that)
            => that.typeArguments exists
            then "MemberNameWithTypeArguments {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``typeArguments = ``transformWithIndent(that.typeArguments)``;
                  ``indent``}"
            else "MemberNameWithTypeArguments(``transformWithIndent(that.name)``)";
    transformLargeAsOperation(LargeAsOperation that)
            => "LargeAsOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformLargerOperation(LargerOperation that)
            => "LargerOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformLazySpecifier(LazySpecifier that) => "LazySpecifier(``transformWithIndent(that.expression)``)";
    transformMeasureOperation(MeasureOperation that)
            => "MeasureOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformMemberMeta(MemberMeta that)
            => "MemberMeta {
                `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                `` indent + indentLevel ``nameWithArguments = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformModuleDec(ModuleDec that) => "ModuleDec(``transformWithIndent(that.moduleName)``)";
    transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that)
            => "MultiplyAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformNamedArguments(NamedArguments that)
            => that.iterableArgument.children nonempty
            then "NamedArguments {
                  `` indent + indentLevel ``namedArguments = ``transformWithIndent(that.namedArguments)``;
                  `` indent + indentLevel ``iterableArgument = ``transformWithIndent(that.iterableArgument)``;
                  ``indent``}"
            else (that.namedArguments nonempty
                then "NamedArguments(``transformWithIndent(that.namedArguments)``)"
                else "NamedArguments()");
    transformNegationOperation(NegationOperation that) => "NegationOperation(``transformWithIndent(that.operand)``)";
    transformNonemptyOperation(NonemptyOperation that) => "NonemptyOperation(``transformWithIndent(that.operand)``)";
    transformNotEqualOperation(NotEqualOperation that)
            => "NotEqualOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformNotOperation(NotOperation that) => "NotOperation(``transformWithIndent(that.operand)``)";
    transformOfOperation(OfOperation that)
            => "OfOperation {
                `` indent + indentLevel ``child = ``transformWithIndent(that.operand)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                ``indent``}";
    transformOpenBound(OpenBound that) => "OpenBound(``transformWithIndent(that.endpoint)``)";
    transformOptionalType(OptionalType that) => "OptionalType(``transformWithIndent(that.definiteType)``)";
    transformOrAssignmentOperation(OrAssignmentOperation that)
            => "OrAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformOrOperation(OrOperation that)
            => "OrOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformOutModifier(OutModifier that) => "OutModifier()";
    transformOuter(Outer that) => "Outer()";
    transformPackage(Package that) => "Package()";
    transformPackageDec(PackageDec that) => "PackageDec(``transformWithIndent(that.packageName)``)";
    transformParameterReference(ParameterReference that) => "ParameterReference(``transformWithIndent(that.name)``)";
    transformParameters(Parameters that)
            => that.parameters nonempty
            then "Parameters(``transformWithIndent(that.parameters)``)"
            else "Parameters()";
    transformPositionalArguments(PositionalArguments that) => "PositionalArguments(``transformWithIndent(that.argumentList)``)";
    transformPostfixDecrementOperation(PostfixDecrementOperation that) => "PostfixDecrementOperation(``transformWithIndent(that.operand)``)";
    transformPostfixIncrementOperation(PostfixIncrementOperation that) => "PostfixIncrementOperation(``transformWithIndent(that.operand)``)";
    transformPrefixDecrementOperation(PrefixDecrementOperation that) => "PrefixDecrementOperation(``transformWithIndent(that.operand)``)";
    transformPrefixIncrementOperation(PrefixIncrementOperation that) => "PrefixIncrementOperation(``transformWithIndent(that.operand)``)";
    transformProductOperation(ProductOperation that)
            => "ProductOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformQualifiedExpression(QualifiedExpression that)
            => "QualifiedExpression {
                `` indent + indentLevel ``receiverExpression = ``transformWithIndent(that.receiverExpression)``;
                `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformQualifiedType(QualifiedType that)
            => "QualifiedType {
                `` indent + indentLevel ``qualifyingType = ``transformWithIndent(that.qualifyingType)``;
                `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformQuotientOperation(QuotientOperation that)
            => "QuotientOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformRemainderAssignmentOperation(RemainderAssignmentOperation that)
            => "RemainderAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformRemainderOperation(RemainderOperation that)
            => "RemainderOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformScaleOperation(ScaleOperation that)
            => "ScaleOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSequentialType(SequentialType that) => "SequentialType(``transformWithIndent(that.elementType)``)";
    transformSmallAsOperation(SmallAsOperation that)
            => "SmallAsOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSmallerOperation(SmallerOperation that)
            => "SmallerOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSpanOperation(SpanOperation that)
            => "SpanOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSpecifiedArgument(SpecifiedArgument that) => "SpecifiedArgument(``transformWithIndent(that.specification)``)";
    transformSpecifier(Specifier that) => "Specifier(``transformWithIndent(that.expression)``)";
    transformSpreadArgument(SpreadArgument that) => "SpreadArgument(``transformWithIndent(that.argument)``)";
    transformStringLiteral(StringLiteral that) => "StringLiteral(\"\"\"``that.text``\"\"\", ``that.isVerbatim``)";
    transformSubtractAssignmentOperation(SubtractAssignmentOperation that)
            => "SubtractAssignmentOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSumOperation(SumOperation that)
            => "SumOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSuper(Super that) => "Super()";
    transformThenOperation(ThenOperation that)
            => "ThenOperation {
                `` indent + indentLevel ``condition = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``result = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformThis(This that) => "This()";
    transformTuple(Tuple that) => "Tuple(``transformWithIndent(that.argumentList)``)";
    transformTupleType(TupleType that) => "TupleType(``transformWithIndent(that.typeList)``)";
    transformTypeArgument(TypeArgument that)
            => "TypeArgument {
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``variance = ``transformWithIndent(that.variance)``;
                ``indent``}";
    transformTypeList(TypeList that)
            => that.variadic exists
            then "TypeList {
                  `` indent + indentLevel ``elements = ``transformWithIndent(that.elements)``;
                  `` indent + indentLevel ``variadic = ``transformWithIndent(that.variadic)``;
                  ``indent``}"
            else "TypeList(``transformWithIndent(that.elements)``)";
    transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that)
            => that.typeArguments exists
            then "TypeList {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``typeArguments = ``transformWithIndent(that.typeArguments)``;
                  }"
            else "TypeList(``transformWithIndent(that.name)``)";
    transformTypeMeta(TypeMeta that) => "TypeMeta(``transformWithIndent(that.type)``)";
    transformTypeParameter(TypeParameter that)
            => "TypeParameter {
                `` indent + indentLevel ``parameterName = ``transformWithIndent(that.parameterName)``;
                `` indent + indentLevel ``variance = ``transformWithIndent(that.variance)``;
                `` indent + indentLevel ``defaultArgument = ``transformWithIndent(that.defaultArgument)``;
                ``indent``}";
    transformUIdentifier(UIdentifier that) => "UIdentifier(\"``that.name``\", ``that.enforcePrefix``)";
    transformUnionType(UnionType that)
            => "UnionType(``transformWithIndent(that.children)``)";
    transformUnionAssignmentOperation(UnionAssignmentOperation that)
            => "UnionAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformUnionOperation(UnionOperation that)
            => "UnionOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformValueDeclaration(ValueDeclaration that)
            => "ValueDeclaration {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformValueDefinition(ValueDefinition that)
            => "ValueDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformValueModifier(ValueModifier that) => "ValueModifier()";
    transformValueParameter(ValueParameter that)
            => "ValueParameter {
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                ``indent``}";
    transformValueSpecification(ValueSpecification that)
            => "ValueSpecification {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformVariadicParameter(VariadicParameter that)
            => "VariadicParameter {
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                ``indent``}";
    transformVariadicType(VariadicType that)
            => that.isNonempty
            then "VariadicType {
                  `` indent + indentLevel ``elementType = ``transformWithIndent(that.elementType)``;
                  `` indent + indentLevel ``isNonempty = true;
                  ``indent``}"
            else "VariadicType(``transformWithIndent(that.elementType)``)";
    transformVoidModifier(VoidModifier that) => "VoidModifier()";
    transformWithinOperation(WithinOperation that)
            => "WithinOperation {
                `` indent + indentLevel ``operand = ``transformWithIndent(that.operand)``;
                `` indent + indentLevel ``lowerBound = ``transformWithIndent(that.lowerBound)``;
                `` indent + indentLevel ``upperBound = ``transformWithIndent(that.upperBound)``;
                ``indent``}";
}

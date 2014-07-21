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
    
    String transformWithIndent(Node? that) {
        if (exists that) {
            value origIndent = indent;
            indent += indentLevel;
            value ret = that.transform(this);
            indent = origIndent;
            return ret;
        } else {
            return "null";
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
    shared actual String transformArgumentList(ArgumentList that) {
        if (nonempty listedArguments = that.listedArguments) {
            StringBuilder code = StringBuilder();
            code.append("ArgumentList {");
            value origIndent = indent;
            indent += indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append("listedArguments = [");
            code.appendNewline();
            indent += indentLevel;
            code.append(indent);
            code.append(listedArguments.first.transform(this));
            for (listedArgument in listedArguments.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(listedArgument.transform(this));
            }
            code.appendNewline();
            code.append(origIndent + indentLevel);
            code.append("];");
            code.appendNewline();
            if (exists sequenceArgument = that.sequenceArgument) {
                indent = origIndent + indentLevel;
                code.append(indent);
                code.append("sequenceArgument = ");
                code.append(sequenceArgument.transform(this));
                code.append(";");
                code.appendNewline();
            }
            indent = origIndent;
            code.append(indent);
            code.append("}");
            return code.string;
        } else {
            if (exists sequenceArgument = that.sequenceArgument) {
                StringBuilder code = StringBuilder();
                code.append("ArgumentList {");
                value origIndent = indent;
                indent = origIndent + indentLevel;
                code.appendNewline();
                code.append(indent);
                code.append("listedArguments = [];");
                code.appendNewline();
                code.append(indent);
                code.append("sequenceArgument = ");
                code.append(sequenceArgument.transform(this));
                code.append(";");
                code.appendNewline();
                indent = origIndent;
                code.append(indent);
                code.append("}");
                return code.string;
            } else {
                return "ArgumentList()";
            }
        }
    }
    transformAnnotation(Annotation that)
            => "Annotation {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``arguments = ``transformWithIndent(that.arguments)``;
                ``indent``}";
    shared actual String transformAnnotations(Annotations that) {
        void appendAnnotations(String origIndent, [Annotation+] annotations, StringBuilder code) {
            code.appendNewline();
            code.append(indent);
            code.append("annotations = [");
            indent += indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append(annotations.first.transform(this));
            for (annotation in annotations.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(annotation.transform(this));
            }
            code.appendNewline();
            code.append(origIndent);
            code.append(indentLevel);
            code.append("];");
            indent = origIndent;
        }
        if (exists anonymousAnnotation = that.anonymousAnnotation) {
            if (nonempty annotations = that.annotations) {
                StringBuilder code = StringBuilder();
                code.append("Annotations {");
                value origIndent = indent;
                indent = origIndent + indentLevel;
                code.appendNewline();
                code.append(indent);
                code.append("anonymousAnnotation = ");
                code.append(anonymousAnnotation.transform(this));
                code.append(";");
                appendAnnotations(origIndent, annotations, code);
                code.appendNewline();
                code.append(indent);
                code.append("}");
                return code.string;
            } else {
                return "Annotations(``transformWithIndent(anonymousAnnotation)``)";
            }
        } else {
            if (nonempty annotations = that.annotations) {
                StringBuilder code = StringBuilder();
                code.append("Annotations {");
                value origIndent = indent;
                indent = origIndent + indentLevel;
                appendAnnotations(origIndent, annotations, code);
                code.appendNewline();
                code.append(indent);
                code.append("}");
                return code.string;
            } else {
                return "Annotations()";
            }
        }
    }
    transformAnonymousArgument(AnonymousArgument that) => "AnonymousArgument(``transformWithIndent(that.expression)``)";
    transformAssignOperation(AssignOperation that)
            => "AssignOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``expression = ``transformWithIndent(that.expression)``;
                ``indent``}";
    transformBaseExpression(BaseExpression that) => "BaseExpression(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseMeta(BaseMeta that) => "BaseMeta(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseType(BaseType that) => "BaseType(``transformWithIndent(that.nameAndArgs)``)";
    transformCallableType(CallableType that)
            => "CallableType {
                `` indent + indentLevel ``returnType = ``transformWithIndent(that.returnType)``;
                `` indent + indentLevel ``argumentTypes = ``transformWithIndent(that.argumentTypes)``;
                ``indent``}";
    transformCharacterLiteral(CharacterLiteral that) => "CharacterLiteral(\"\"\"``that.text``\"\"\")";
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
    transformDefaultedType(DefaultedType that) => "DefaultedType(``transformWithIndent(that.type)``)";
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
    shared actual String transformFullPackageName(FullPackageName that) {
        if (that.components.size == 1) {
            StringBuilder code = StringBuilder();
            code.append("FullPackageName([");
            value origIndent = indent;
            indent = indent + indentLevel + indentLevel;
            code.append(that.components.first.transform(this));
            code.append("])");
            indent = origIndent;
            return code.string;
        } else {
            StringBuilder code = StringBuilder();
            code.append("FullPackageName([");
            value origIndent = indent;
            indent = indent + indentLevel + indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append(that.components.first.transform(this));
            for (component in that.components.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(component.transform(this));
            }
            code.appendNewline();
            code.append(origIndent + indentLevel);
            code.append("])");
            indent = origIndent;
            return code.string;
        }
    }
    transformGivenDec(GivenDec that) => "GivenDec(``transformWithIndent(that.typeParameter)``)";
    transformGroupedExpression(GroupedExpression that) => "GroupedExpression(``transformWithIndent(that.innerExpression)``)";
    transformGroupedType(GroupedType that) => "GroupedType(``transformWithIndent(that.type)``)";
    transformIdenticalOperation(IdenticalOperation that)
            => "IdenticalOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformIdentityOperation(IdentityOperation that) => "IdentityOperation(``transformWithIndent(that.operand)``)";
    transformInOperation(InOperation that)
            => "InOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformIntegerLiteral(IntegerLiteral that) => "IntegerLiteral(\"``that.text``\")";
    shared actual String transformIntersectionType(IntersectionType that) {
        StringBuilder code = StringBuilder();
        code.append("IntersectionType([");
        value origIndent = indent;
        indent = indent + indentLevel + indentLevel;
        code.appendNewline();
        code.append(indent);
        code.append(that.children.first.transform(this));
        for (elementType in that.children.rest) {
            code.append(",");
            code.appendNewline();
            code.append(indent);
            code.append(elementType.transform(this));
        }
        code.appendNewline();
        code.append(origIndent + indentLevel);
        code.append("])");
        indent = origIndent;
        return code.string;
    }
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
    shared actual String transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) {
        if (exists typeArguments = that.typeArguments) {
            StringBuilder code = StringBuilder();
            code.append("MemberNameWithTypeArguments {");
            value origIndent = indent;
            indent += indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append("name = ");
            code.append(that.name.transform(this));
            code.append(";");
            code.appendNewline();
            code.append(indent);
            code.append("typeArguments = [");
            code.appendNewline();
            indent += indentLevel;
            code.append(indent);
            code.append(typeArguments.first.transform(this));
            for (argument in typeArguments.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(argument.transform(this));
            }
            code.appendNewline();
            code.append(origIndent + indentLevel);
            code.append("];");
            code.appendNewline();
            indent = origIndent;
            code.append(indent);
            code.append("}");
            return code.string;
        } else {
            return "MemberNameWithTypeArguments(``that.name.transform(this)``)";
        }
    }
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
    shared actual String transformNamedArguments(NamedArguments that) {
        if (nonempty namedArguments = that.namedArguments) {
            StringBuilder code = StringBuilder();
            code.append("NamedArguments {");
            value origIndent = indent;
            indent += indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append("namedArguments = [");
            code.appendNewline();
            indent += indentLevel;
            code.append(indent);
            code.append(namedArguments.first.transform(this));
            for (namedArgument in namedArguments.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(namedArgument.transform(this));
            }
            code.appendNewline();
            code.append(origIndent + indentLevel);
            code.append("];");
            code.appendNewline();
            if (that.iterableArgument.children nonempty) {
                indent = origIndent + indentLevel;
                code.append(indent);
                code.append("iterableArgument = ");
                code.append(that.iterableArgument.transform(this));
                code.append(";");
                code.appendNewline();
            }
            indent = origIndent;
            code.append(indent);
            code.append("}");
            return code.string;
        } else {
            if (that.iterableArgument.children nonempty) {
                StringBuilder code = StringBuilder();
                code.append("ArgumentList {");
                value origIndent = indent;
                indent = origIndent + indentLevel;
                code.appendNewline();
                code.append(indent);
                code.append("namedArguments = [];");
                code.appendNewline();
                code.append(indent);
                code.append("iterableArgument = ");
                code.append(that.iterableArgument.transform(this));
                code.append(";");
                code.appendNewline();
                indent = origIndent;
                code.append(indent);
                code.append("}");
                return code.string;
            } else {
                return "ArgumentList()";
            }
        }
    }
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
    transformOuter(Outer that) => "Outer()";
    transformPackage(Package that) => "Package()";
    transformPackageDec(PackageDec that) => "PackageDec(``transformWithIndent(that.packageName)``)";
    transformParameterReference(ParameterReference that) => "ParameterReference(``transformWithIndent(that.name)``)";
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
    shared actual String transformTypeList(TypeList that) {
        if (nonempty elements = that.elements) {
            StringBuilder code = StringBuilder();
            code.append("TypeList([");
            value origIndent = indent;
            indent = indent + indentLevel + indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append(elements.first.transform(this));
            for (element in elements.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(element.transform(this));
            }
            code.appendNewline();
            indent = origIndent + indentLevel;
            code.append(indent);
            code.append("]");
            if (exists var = that.variadic) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(var.transform(this));
            }
            code.append(")");
            indent = origIndent;
            return code.string;
        } else {
            if (exists var = that.variadic) {
                return "TypeList([], ``transformWithIndent(var)``)";
            } else {
                return "TypeList([])";
            }
        }
    }
    shared actual String transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) {
        if (exists arguments = that.typeArguments) {
            StringBuilder code = StringBuilder();
            code.append("TypeNameWithTypeArguments {");
            value origIndent = indent;
            indent += indentLevel;
            code.appendNewline();
            code.append(indent);
            code.append("name = ");
            code.append(that.name.transform(this));
            code.append(";");
            code.appendNewline();
            code.append(indent);
            code.append("arguments = [");
            code.appendNewline();
            indent += indentLevel;
            code.append(indent);
            code.append(arguments.first.transform(this));
            for (argument in arguments.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(argument.transform(this));
            }
            code.appendNewline();
            code.append(origIndent + indentLevel);
            code.append("];");
            code.appendNewline();
            indent = origIndent;
            code.append(indent);
            code.append("}");
            return code.string;
        } else {
            return "TypeNameWithTypeArguments(``that.name.transform(this)``)";
        }
    }
    transformTypeMeta(TypeMeta that) => "TypeMeta(``transformWithIndent(that.type)``)";
    transformUIdentifier(UIdentifier that) => "UIdentifier(\"``that.name``\", ``that.enforcePrefix``)";
    shared actual String transformUnionType(UnionType that) {
        StringBuilder code = StringBuilder();
        code.append("UnionType([");
        value origIndent = indent;
        indent = indent + indentLevel + indentLevel;
        code.appendNewline();
        code.append(indent);
        code.append(that.children.first.transform(this));
        for (elementType in that.children.rest) {
            code.append(",");
            code.appendNewline();
            code.append(indent);
            code.append(elementType.transform(this));
        }
        code.appendNewline();
        code.append(origIndent + indentLevel);
        code.append("])");
        indent = origIndent;
        return code.string;
    }
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
    transformValueSpecification(ValueSpecification that)
            => "ValueSpecification {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformVariadicType(VariadicType that)
            => that.isNonempty
            then "VariadicType {
                  `` indent + indentLevel ``elementType = ``transformWithIndent(that.elementType)``;
                  `` indent + indentLevel ``isNonempty = true;
                  ``indent``}"
            else "VariadicType(``transformWithIndent(that.elementType)``)";
}

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
    
    transformBaseExpression(BaseExpression that) => "BaseExpression(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseType(BaseType that) => "BaseType(``transformWithIndent(that.nameAndArgs)``)";
    transformCallableType(CallableType that)
            => "CallableType {
                `` indent + indentLevel ``returnType = ``transformWithIndent(that.returnType)``;
                `` indent + indentLevel ``argumentTypes = ``transformWithIndent(that.argumentTypes)``;
                ``indent``}";
    transformCharacterLiteral(CharacterLiteral that) => "CharacterLiteral(\"\"\"``that.text``\"\"\")";
    transformCompilationUnit(CompilationUnit that) => "CompilationUnit()";
    transformDefaultedType(DefaultedType that) => "DefaultedType(``transformWithIndent(that.type)``)";
    transformEntryType(EntryType that)
            => "EntryType {
                `` indent + indentLevel ``key = ``transformWithIndent(that.key)``;
                `` indent + indentLevel ``item = ``transformWithIndent(that.item)``;
                ``indent``}";
    transformFloatLiteral(FloatLiteral that) => "FloatLiteral(\"``that.text``\")";
    transformGroupedExpression(GroupedExpression that) => "GroupedExpression(``transformWithIndent(that.innerExpression)``)";
    transformGroupedType(GroupedType that) => "GroupedType(``transformWithIndent(that.type)``)";
    transformIntegerLiteral(IntegerLiteral that) => "IntegerLiteral(\"``that.text``\")";
    shared actual String transformIntersectionType(IntersectionType that) {
        StringBuilder code = StringBuilder();
        code.append("IntersectionType([");
        value origIndent = indent;
        indent = indent + indentLevel + indentLevel;
        code.appendNewline();
        code.append(indent);
        code.append(that.children.first.transform(this));
        for (elementType in that.children) {
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
    transformIterableType(IterableType that) => "IterableType(``transformWithIndent(that.variadicType)``)";
    transformLIdentifier(LIdentifier that) => "LIdentifier(\"``that.name``\", ``that.enforcePrefix``)";
    shared actual String transformNameWithTypeArguments(NameWithTypeArguments that) {
        if (exists typeArguments = that.typeArguments) {
            StringBuilder code = StringBuilder();
            code.append("NameWithTypeArguments {");
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
            return "NameWithTypeArguments(``that.name.transform(this)``)";
        }
    }
    transformOptionalType(OptionalType that) => "OptionalType(``transformWithIndent(that.definiteType)``)";
    transformOuter(Outer that) => "Outer()";
    transformPackage(Package that) => "Package()";
    transformQualifiedType(QualifiedType that)
            => "QualifiedType {
                `` indent + indentLevel ``qualifyingType = ``transformWithIndent(that.qualifyingType)``;
                `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformSequentialType(SequentialType that) => "SequentialType(``transformWithIndent(that.elementType)``)";
    transformStringLiteral(StringLiteral that) => "StringLiteral(\"\"\"``that.text``\"\"\", ``that.isVerbatim``)";
    transformSuper(Super that) => "Super()";
    transformThis(This that) => "This()";
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
    shared actual String transformTypeNameWithArguments(TypeNameWithArguments that) {
        if (exists arguments = that.arguments) {
            StringBuilder code = StringBuilder();
            code.append("TypeNameWithArguments {");
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
            return "TypeNameWithArguments(``that.name.transform(this)``)";
        }
    }
    transformUIdentifier(UIdentifier that) => "UIdentifier(\"``that.name``\", ``that.enforcePrefix``)";
    shared actual String transformUnionType(UnionType that) {
        StringBuilder code = StringBuilder();
        code.append("UnionType([");
        value origIndent = indent;
        indent = indent + indentLevel + indentLevel;
        code.appendNewline();
        code.append(indent);
        code.append(that.children.first.transform(this));
        for (elementType in that.children) {
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
    transformVariadicType(VariadicType that)
            => that.isNonempty
            then "VariadicType {
                  `` indent + indentLevel ``elementType = ``transformWithIndent(that.elementType)``;
                  `` indent + indentLevel ``isNonempty = true;
                  ``indent``}"
            else "VariadicType(``transformWithIndent(that.elementType)``)";
}

"Builds a Ceylon expression string for an AST node;
 compiling and evaluating the resulting string will yield
 a copy of the transformed node.
 
 Usage:
 ~~~
 myNode.transform(CeylonExpressionTransformer());
 ~~~"
shared class CeylonExpressionTransformer() extends NarrowingTransformer<String>() {
    
    variable String indent = "";
    
    String transformWithIndent(Node that) {
        value origIndent = indent;
        indent += "    ";
        value ret = that.transform(this);
        indent = origIndent;
        return ret;
    }
    
    transformBaseType(BaseType that) => "BaseType(``transformWithIndent(that.nameAndArgs)``)";
    transformCharacterLiteral(CharacterLiteral that) => "CharacterLiteral(\"\"\"``that.text``\"\"\")";
    transformCompilationUnit(CompilationUnit that) => "CompilationUnit()";
    transformFloatLiteral(FloatLiteral that) => "FloatLiteral(\"``that.text``\")";
    transformGroupedType(GroupedType that) => "GroupedType(``transformWithIndent(that.type)``)";
    transformIntegerLiteral(IntegerLiteral that) => "IntegerLiteral(\"``that.text``\")";
    transformLIdentifier(LIdentifier that) => "LIdentifier(\"``that.name``\", ``that.enforcePrefix``)";
    transformOuter(Outer that) => "Outer()";
    transformPackage(Package that) => "Package()";
    transformQualifiedType(QualifiedType that)
            => "QualifiedType {
                ``indent``    qualifyingType = ``transformWithIndent(that.qualifyingType)``;
                ``indent``    nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformStringLiteral(StringLiteral that) => "StringLiteral(\"\"\"``that.text``\"\"\", ``that.isVerbatim``)";
    transformSuper(Super that) => "Super()";
    transformThis(This that) => "This()";
    shared actual String transformTypeNameWithArguments(TypeNameWithArguments that) {
        if (exists arguments = that.arguments) {
            StringBuilder code = StringBuilder();
            code.append("TypeNameWithArguments {");
            value origIndent = indent;
            indent += "    ";
            code.appendNewline();
            code.append(indent);
            code.append("name = ");
            code.append(that.name.transform(this));
            code.append(";");
            code.appendNewline();
            code.append(indent);
            code.append("arguments = [");
            code.appendNewline();
            indent += "    ";
            for (argument in arguments) {
                code.append(indent);
                code.append(argument.transform(this));
                code.append(",");
                code.appendNewline();
            }
            code.append(origIndent + "    ");
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
}

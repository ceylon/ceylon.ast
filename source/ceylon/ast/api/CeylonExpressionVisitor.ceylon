"Builds a Ceylon expression string for an AST node;
 compiling and evaluating the resulting string will yield
 a copy of the visited node.
 
 Usage:
 ~~~
 value cev = CeylonExpressionVisitor();
 myNode.visit(cev);
 String code = cev.string;
 ~~~"
shared class CeylonExpressionVisitor() extends Visitor() {
    
    StringBuilder code = StringBuilder();
    variable String indent = "";
    
    string => code.string;
    
    visitCharacterLiteral(CharacterLiteral that) => code.append("CharacterLiteral(\"\"\"``that.text``\"\"\")");
    visitCompilationUnit(CompilationUnit that) => code.append("CompilationUnit()");
    visitFloatLiteral(FloatLiteral that) => code.append("FloatLiteral(\"``that.text``\")");
    visitIntegerLiteral(IntegerLiteral that) => code.append("IntegerLiteral(\"``that.text``\")");
    visitLIdentifier(LIdentifier that) => code.append("LIdentifier(\"``that.name``\", ``that.enforcePrefix``)");
    visitOuter(Outer that) => code.append("Outer()");
    visitPackage(Package that) => code.append("Package()");
    visitStringLiteral(StringLiteral that) => code.append("StringLiteral(\"\"\"``that.text``\"\"\", ``that.isVerbatim``)");
    visitSuper(Super that) => code.append("Super()");
    visitThis(This that) => code.append("This()");
    shared actual void visitTypeNameWithArguments(TypeNameWithArguments that) {
        if (exists arguments = that.arguments) {
            code.append("TypeNameWithArguments {");
            value origIndent = indent;
            indent += "    ";
            code.appendNewline();
            code.append(indent);
            code.append("name = ");
            that.name.visit(this);
            code.append(";");
            code.appendNewline();
            code.append(indent);
            code.append("arguments = [");
            code.appendNewline();
            indent += "    ";
            for (argument in arguments) {
                code.append(indent);
                argument.visit(this);
                code.append(",");
                code.appendNewline();
            }
            code.append(origIndent + "    ");
            code.append("];");
            code.appendNewline();
            indent = origIndent;
            code.append(indent);
            code.append("}");
        } else {
            code.append("TypeNameWithArguments(");
            that.name.visit(this);
            code.append(", null)");
        }
    }
    visitUIdentifier(UIdentifier that) => code.append("UIdentifier(\"``that.name``\", ``that.enforcePrefix``)");
}

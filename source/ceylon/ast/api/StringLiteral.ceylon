"A *string literal* consists of a series of characters and/or,
 if it’s not [[verbatim|isVerbatim]], escape sequences.
 
 Note: in contrast to [[IntegerLiteral]] and [[FloatLiteral]], the value of [[text]]
 isn’t verified, and there is no attribute to get the [[String]] value of the literal;
 getting that value requires unicode support (to parse '\\{CHARACTER NAME}') that isn’t
 available on all platforms."
shared class StringLiteral(text, isVerbatim = false) extends Literal(text) {
    
    "The text of the string literal (without quotes)."
    shared actual String text;
    "If the string literal is verbatim or not. Verbatim string literals are
     surrounded by three quotes instead of one, and do not contain escape sequences.
     
     Note: While the default value is [[false]] because that’s the least surprising choice,
     you should use [[true]] instead unless you really need escape sequences;
     this makes your code more robust, especially if the [[text]] is coming from an external source."
    shared Boolean isVerbatim;
    
    visit(Visitor visitor) => visitor.visitStringLiteral(this);
    edit(Editor editor) => editor.editStringLiteral(this);
    
    toCeylonExpression() => "StringLiteral(\"\"\"``text``\"\"\", ``isVerbatim``)";
    
    shared actual Boolean equals(Object other) {
        if (is StringLiteral other) {
            return isVerbatim == other.isVerbatim && text == other.text;
        } else {
            return false;
        }
    }
    
    hash => 31 * text.hash + isVerbatim.hash;
    
    shared StringLiteral copy(String text = this.text, Boolean isVerbatim = this.isVerbatim)
            => StringLiteral(text, isVerbatim);
}

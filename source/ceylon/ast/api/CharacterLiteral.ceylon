"A *character literal* consists of a single character or an escape sequence.
 
 Note: in contrast to [[IntegerLiteral]] and [[FloatLiteral]], the value of [[text]]
 isn’t verified, and there is no attribute to get the [[Character]] value of the literal;
 getting that value requires unicode support (to parse '\\{CHARACTER NAME}') that isn’t
 available on all platforms."
shared class CharacterLiteral(text) extends Literal(text) {
    
    "The text of the character literal (without quotes),
     i. e. either a single character or an escape sequence."
    shared actual String text;
    
    visit(Visitor visitor) => visitor.visitCharacterLiteral(this);
    edit(Editor editor) => editor.editCharacterLiteral(this);
    
    toCeylonExpression() => "CharacterLiteral(\"\"\"``text``\"\"\")";
    
    shared actual Boolean equals(Object other) {
        if (is CharacterLiteral other) {
            return text == other.text;
        } else {
            return false;
        }
    }
    
    hash => text.hash;
    
    shared CharacterLiteral copy(String text = this.text)
            => CharacterLiteral(text);
}

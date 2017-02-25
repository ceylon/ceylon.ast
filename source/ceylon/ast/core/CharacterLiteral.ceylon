"A *character literal* consists of a single character or an escape sequence."
shared class CharacterLiteral(text) extends Literal(text) {
    
    "The text of the character literal (without quotes),
     i. e. either a single character or an escape sequence."
    shared actual String text;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCharacterLiteral(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCharacterLiteral(this);
    
    shared actual Boolean equals(Object that) {
        if (is CharacterLiteral that) {
            return text == that.text;
        } else {
            return false;
        }
    }
    
    hash => text.hash;
    
    shared CharacterLiteral copy(String text = this.text) {
        value ret = CharacterLiteral(text);
        copyExtraInfoTo(ret);
        return ret;
    }
}

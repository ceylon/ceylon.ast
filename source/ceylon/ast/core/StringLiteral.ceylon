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
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformStringLiteral(this);
    
    shared actual Boolean equals(Object that) {
        if (is StringLiteral that) {
            return isVerbatim == that.isVerbatim && text == that.text;
        } else {
            return false;
        }
    }
    
    hash => 31 * text.hash + isVerbatim.hash;
    
    shared StringLiteral copy(String text = this.text, Boolean isVerbatim = this.isVerbatim) {
        value ret = StringLiteral(text, isVerbatim);
        copyExtraInfoTo(ret);
        return ret;
    }
}

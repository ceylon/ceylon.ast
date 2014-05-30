"A *literal* is a single token that represents a Unicode character,
 a character string, or a numeric value."
shared abstract class Literal(text)
            of StringLiteral|CharacterLiteral|IntegerLiteral|FloatLiteral
            extends Expression([]) {
    
    "The text of the literal, without any quoting."
    shared default String text;
}

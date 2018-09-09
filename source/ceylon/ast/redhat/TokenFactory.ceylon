import org.antlr.runtime {
    CommonToken
}

"A factory of tokens with a given text.
 
 Three implementations are provided in this module:
 - [[BasicTokenFactory]], probably too basic if the tokens will actually
   be used, but still useful if you just need “any token factory”
 - [[SimpleTokenFactory]], “default” but still lightweight implementation
 - [[TokenSourceTokenFactory]], if you want to create a token stream
   with all the tokens"
shared interface TokenFactory {
    "Creates a [[CommonToken]] with the specified [[text]] and [[type]]."
    shared formal CommonToken token(
        "The text of the token."
        String text,
        "The type of the token.
         
         Use the constants from [[org.eclipse.ceylon.compiler.typechecker.parser::CeylonLexer]]."
        Integer type);
}

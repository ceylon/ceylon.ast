import org.antlr.runtime {
    CommonToken
}

"A factory of tokens with a given text."
shared interface TokenFactory {
    "Creates a [[CommonToken]] with the specified [[text]], [[type]], and [[length]]."
    shared formal CommonToken token(
        "The text of the token."
        String text,
        "The type of the token.
         
         Use the constants from [[com.redhat.ceylon.compiler.typechecker.parser::CeylonLexer]]."
        Integer type,
        """The length of the token.
           
           Defaults to [[text]]`.length`, and this is what you want in *almost* all cases;
           the only exception are identifier tokens like `\iCONSTANT`
           where the text is just `"CONSTANT"`, but the length is still 10."""
        Integer length = text.size);
}

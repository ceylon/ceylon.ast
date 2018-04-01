import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream
}
import org.eclipse.ceylon.compiler.typechecker.parser {
    CeylonLexer,
    CeylonParser
}

"Creates a [[Ceylon parser|CeylonParser]] that operates on the given [[code]]."
shared CeylonParser createParser(String code)
        => CeylonParser(CommonTokenStream(CeylonLexer(ANTLRStringStream(code + " ")))); // the lexer seems to need the trailing space

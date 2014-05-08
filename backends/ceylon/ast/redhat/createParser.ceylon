import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer,
    CeylonParser
}

"Creates a [[Ceylon parser|CeylonParser]] that operates on the given [[code]]."
shared CeylonParser createParser(String code)
        => CeylonParser(CommonTokenStream(CeylonLexer(ANTLRStringStream(code))));

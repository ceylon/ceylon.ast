import ceylon.ast.core {
    Alias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        uidentifier=\iUIDENTIFIER
    }
}

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[Alias]]."
shared Alias aliasToCeylon(JAlias \ialias) {
    if (\ialias.identifier.token.type == uidentifier) {
        return typeAliasToCeylon(\ialias);
    } else {
        return functionValueAliasToCeylon(\ialias);
    }
}

"Compiles the given [[code]] for an Alias
 into an [[Alias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared Alias? compileAlias(String code) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import elemen
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias) {
        return aliasToCeylon(jAlias);
    } else {
        return null;
    }
}

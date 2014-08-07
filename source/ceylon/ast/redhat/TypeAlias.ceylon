import ceylon.ast.core {
    TypeAlias
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

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[TypeAlias]]."
shared TypeAlias typeAliasToCeylon(JAlias typeAlias) {
    return TypeAlias(uIdentifierToCeylon(typeAlias.identifier));
}

"Compiles the given [[code]] for a Type Alias
 into a [[TypeAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared TypeAlias? compileTypeAlias(String code) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import elemen
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias,
        jAlias.identifier.mainToken.type == uidentifier) {
        return typeAliasToCeylon(jAlias);
    } else {
        return null;
    }
}

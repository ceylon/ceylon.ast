import ceylon.ast.core {
    ImportTypeAlias
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

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[ImportTypeAlias]]."
shared ImportTypeAlias importTypeAliasToCeylon(JAlias importTypeAlias) {
    return ImportTypeAlias(uIdentifierToCeylon(importTypeAlias.identifier));
}

"Compiles the given [[code]] for an Import Type Alias
 into an [[ImportTypeAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportTypeAlias? compileImportTypeAlias(String code) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import element
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias,
        jAlias.identifier.mainToken.type == uidentifier) {
        return importTypeAliasToCeylon(jAlias);
    } else {
        return null;
    }
}

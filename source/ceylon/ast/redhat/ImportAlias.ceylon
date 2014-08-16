import ceylon.ast.core {
    ImportAlias
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

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[ImportAlias]]."
shared ImportAlias importAliasToCeylon(JAlias importAlias) {
    if (importAlias.identifier.token.type == uidentifier) {
        return importTypeAliasToCeylon(importAlias);
    } else {
        return importFunctionValueAliasToCeylon(importAlias);
    }
}

"Compiles the given [[code]] for an Import Alias
 into an [[ImportAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportAlias? compileImportAlias(String code) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import element
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias) {
        return importAliasToCeylon(jAlias);
    } else {
        return null;
    }
}

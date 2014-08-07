import ceylon.ast.core {
    FunctionValueAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        lidentifier=\iLIDENTIFIER
    }
}

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[FunctionValueAlias]]."
shared FunctionValueAlias functionValueAliasToCeylon(JAlias functionValueAlias) {
    return FunctionValueAlias(lIdentifierToCeylon(functionValueAlias.identifier));
}

"Compiles the given [[code]] for a Function Value Alias
 into a [[FunctionValueAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared FunctionValueAlias? compileFunctionValueAlias(String code) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import elemen
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias,
        jAlias.identifier.mainToken.type == lidentifier) {
        return functionValueAliasToCeylon(jAlias);
    } else {
        return null;
    }
}

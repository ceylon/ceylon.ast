import ceylon.ast.core {
    ImportFunctionValueAlias,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAlias=Alias
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        lidentifier=\iLIDENTIFIER
    }
}

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[ImportFunctionValueAlias]]."
shared ImportFunctionValueAlias importFunctionValueAliasToCeylon(JAlias importFunctionValueAlias, Anything(JNode,Node) update = noop) {
    value result = ImportFunctionValueAlias(lIdentifierToCeylon(importFunctionValueAlias.identifier, update));
    update(importFunctionValueAlias, result);
    return result;
}

"Compiles the given [[code]] for an Import Function Value Alias
 into an [[ImportFunctionValueAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportFunctionValueAlias? compileImportFunctionValueAlias(String code, Anything(JNode,Node) update = noop) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import element
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias,
        jAlias.identifier.mainToken.type == lidentifier) {
        return importFunctionValueAliasToCeylon(jAlias, update);
    } else {
        return null;
    }
}

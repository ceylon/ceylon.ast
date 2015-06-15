import ceylon.ast.core {
    ImportTypeAlias,
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
        uidentifier=\iUIDENTIFIER
    }
}

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[ImportTypeAlias]]."
shared ImportTypeAlias importTypeAliasToCeylon(JAlias importTypeAlias, Anything(JNode,Node) update = noop) {
    value result = ImportTypeAlias(uIdentifierToCeylon(importTypeAlias.identifier, update));
    update(importTypeAlias, result);
    return result;
}

"Compiles the given [[code]] for an Import Type Alias
 into an [[ImportTypeAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportTypeAlias? compileImportTypeAlias(String code, Anything(JNode,Node) update = noop) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import element
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias,
        jAlias.identifier.mainToken.type == uidentifier) {
        return importTypeAliasToCeylon(jAlias, update);
    } else {
        return null;
    }
}

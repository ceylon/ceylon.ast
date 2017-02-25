import ceylon.ast.core {
    ImportAlias,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAlias=Alias
    }
}

"Converts a RedHat AST [[Alias|JAlias]] to a `ceylon.ast` [[ImportAlias]]."
shared ImportAlias importAliasToCeylon(JAlias importAlias, Anything(JNode, Node) update = noop) {
    value result = ImportAlias(identifierToCeylon(importAlias.identifier, update));
    update(importAlias, result);
    return result;
}

"Parses the given [[code]] for an Import Alias
 into an [[ImportAlias]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportAlias? parseImportAlias(String code, Anything(JNode, Node) update = noop) {
    /*
     there’s no separate rule for an alias (it might not even
     work out to do it that way, parser-wise), so we construct
     a fake import element
     */
    if (exists jImportElement = createParser(code + "i").importElement(),
        exists jAlias = jImportElement.\ialias) {
        return importAliasToCeylon(jAlias, update);
    } else {
        return null;
    }
}

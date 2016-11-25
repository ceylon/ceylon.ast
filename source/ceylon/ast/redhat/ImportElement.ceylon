import ceylon.ast.core {
    ImportElement,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

"Converts a RedHat AST [[ImportMemberOrType|JImportMemberOrType]] to a `ceylon.ast` [[ImportElement]]."
shared ImportElement importElementToCeylon(JImportMemberOrType importElement, Anything(JNode,Node) update = noop) {
    value result = ImportElement {
        identifierToCeylon(importElement.identifier, update);
        importElement.\ialias exists then importAliasToCeylon(importElement.\ialias, update);
        importElement.importMemberOrTypeList exists then importElementsToCeylon(importElement.importMemberOrTypeList, update);
    };
    update(importElement, result);
    return result;
}

"Parses the given [[code]] for an Import Element
 into an [[ImportElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportElement? parseImportElement(String code, Anything(JNode,Node) update = noop) {
    if (exists jImportElement = createParser(code).importElement()) {
        return importElementToCeylon(jImportElement, update);
    } else {
        return null;
    }
}

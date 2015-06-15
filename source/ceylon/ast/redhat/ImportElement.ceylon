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
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonParser {
        uidentifier=\iUIDENTIFIER
    }
}

"Converts a RedHat AST [[ImportMemberOrType|JImportMemberOrType]] to a `ceylon.ast` [[ImportElement]]."
shared ImportElement importElementToCeylon(JImportMemberOrType importElement, Anything(JNode,Node) update = noop) {
    ImportElement result;
    if (importElement.identifier.mainToken.type == uidentifier) {
        result = importTypeElementToCeylon(importElement, update);
    } else {
        result = importFunctionValueElementToCeylon(importElement, update);
    }
    update(importElement, result);
    return result;
}

"Compiles the given [[code]] for an Import Element
 into an [[ImportElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportElement? compileImportElement(String code, Anything(JNode,Node) update = noop) {
    if (exists jImportElement = createParser(code).importElement()) {
        return importElementToCeylon(jImportElement, update);
    } else {
        return null;
    }
}

import ceylon.ast.core {
    ImportFunctionValueElement,
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
        lidentifier=LIDENTIFIER
    }
}

"Converts a RedHat AST [[ImportMemberOrType|JImportMemberOrType]] to a `ceylon.ast` [[ImportFunctionValueElement]]."
shared ImportFunctionValueElement importFunctionValueElementToCeylon(JImportMemberOrType importFunctionValueElement, Anything(JNode,Node) update = noop) {
    value result = ImportFunctionValueElement {
        lIdentifierToCeylon(importFunctionValueElement.identifier, update);
        importFunctionValueElement.\ialias exists then importFunctionValueAliasToCeylon(importFunctionValueElement.\ialias, update);
        importFunctionValueElement.importMemberOrTypeList exists then importElementsToCeylon(importFunctionValueElement.importMemberOrTypeList, update);
    };
    update(importFunctionValueElement, result);
    return result;
}

"Compiles the given [[code]] for an Import Function Value Element
 into an [[ImportFunctionValueElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportFunctionValueElement? compileImportFunctionValueElement(String code, Anything(JNode,Node) update = noop) {
    if (exists jImportElement = createParser(code).importElement(),
        jImportElement.identifier.mainToken.type == lidentifier) {
        return importFunctionValueElementToCeylon(jImportElement, update);
    } else {
        return null;
    }
}

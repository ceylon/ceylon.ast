import ceylon.ast.core {
    ImportFunctionValueElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared ImportFunctionValueElement importFunctionValueElementToCeylon(JImportMemberOrType importFunctionValueElement) {
    return ImportFunctionValueElement {
        lIdentifierToCeylon(importFunctionValueElement.identifier);
        importFunctionValueElement.\ialias exists then importFunctionValueAliasToCeylon(importFunctionValueElement.\ialias);
        importFunctionValueElement.importMemberOrTypeList exists then importElementsToCeylon(importFunctionValueElement.importMemberOrTypeList);
    };
}

"Compiles the given [[code]] for an Import Function Value Element
 into an [[ImportFunctionValueElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportFunctionValueElement? compileImportFunctionValueElement(String code) {
    if (exists jImportElement = createParser(code).importElement(),
        jImportElement.identifier.mainToken.type == lidentifier) {
        return importFunctionValueElementToCeylon(jImportElement);
    } else {
        return null;
    }
}
